class Class
  def attr_property(*accessors)
    accessors.each do |m|
      define_method(m) do |*val|
        instance_variable_set("@#{m}",val.first) unless val.empty? #Array Hack to avoid warning
        instance_variable_get("@#{m}")
      end
    end
  end
end

class Calculation
  def initialize(options={},&block)
    @contents=ActiveSupport::OrderedHash.new
    instance_eval(&block) if block
  end

  def [](sym)
    @contents[sym.to_sym]
  end

  def by_path(path)
    @contents.values.detect { |v| v.path==path }
  end

  def drill_by_path(path)
    drills.values.detect { |v| v.path==path }
  end

  def contents_class(klass)
    ActiveSupport::OrderedHash[@contents.select{|k,v| v.is_a? klass}]
  end

  def chosen_contents_class(klass)
    ActiveSupport::OrderedHash[contents_class(klass).select{|k,v|v.value!=:unset}]
  end

  def unset_contents_class(klass)
    ActiveSupport::OrderedHash[contents_class(klass).select{|k,v|v.value==:unset}]
  end

  def unset_this_and_after!(klass,label)
    found=false
    contents_class(klass).each_value do |x|
      found||=(x.label==label)
      next unless found
      x.value :unset
    end
  end

  def profiles
    contents_class Profile
  end
  
  def drills
    contents_class Drill
  end

  def outputs
    contents_class Output
  end

  def unset_profiles
    unset_contents_class Profile
  end

  def unset_drills
    unset_contents_class Drill
  end

  def satisfied?
    pp unset_drills
    pp unset_profiles
    unset_drills.values.empty? && unset_profiles.values.empty?
  end

  def unset_outputs
    unset_contents_class Output
  end

  def chosen_profiles
    chosen_contents_class Profile
  end

  def chosen_drills
    chosen_contents_class Drill
  end
  def chosen_outputs
    chosen_contents_class Output
  end
  attr_reader :contents
  attr_property :label,:name,:path
  def profile(options={},&block)
    construct(Profile,options,&block)
  end
  def drill(options={},&block)
    construct(Drill,options,&block)
  end
  def output(options={},&block)
    construct(Output,options,&block)
  end
  def construct(klass,options={},&block)
    new_content=klass.new(options.merge(:parent=>self),&block)
    @contents[new_content.label]=new_content
  end
  def drill_options
    chosen_drills.values.map{|x| "#{CGI.escape(x.path)}=#{CGI.escape(x.value)}"}.join("&")
  end
  def profile_options
    result={}
    chosen_profiles.values.each do |piv|
      result[piv.path]=piv.value
    end
    return result
  end
  def get_options
    # Specify unit options here based on the contents
    #getopts={}
    #getopts[:returnUnit] = params[:unit] if params[:unit]
    #getopts[:returnPerUnit] = params[:perUnit] if params[:perUnit]
    return {}
  end
  def amee_drill
    AMEE::Data::DrillDown.get(AMEE::Rails.connection,"/data#{path}/drill?#{drill_options}")
  end
  def profile_category(profile)
    AMEE::Profile::Category.get(AMEE::Rails.connection, "/profiles/#{profile.uid}#{path}")
  end
  def calculate!(profile=nil)
    return unless satisfied?
    profile ||= AMEE::Profile::ProfileList.new(AMEE::Rails.connection).first
    profile ||= AMEE::Profile::Profile.create(AMEE::Rails.connection)
    location = AMEE::Profile::Item.create(profile_category(profile),amee_drill.data_item_uid,
      profile_options.merge(:get_item=>false,:name=>UUIDTools::UUID.timestamp_create))
    item=AMEE::Profile::Item.get(AMEE::Rails.connection, location, get_options)
    # Extract default result
    unset_outputs.values.each do |output|
      res=nil
      if output.path==:default
        res= item.amounts.find{|x| x[:default] == true}
      else
        res= item.amounts.find{|x| x[:type] == output.path}
      end
      output.value res[:value] if res
    end
    return self
  ensure
    # Tidy up
    if location
      AMEE::Profile::Item.delete(AMEE::Rails.connection,location)
    end
  end
  def initialize_copy(source)
    super
    @contents=ActiveSupport::OrderedHash.new
    source.contents.each do |k,v|
      @contents[k]=v.clone
      @contents[k].parent=self
    end
  end

  def choose!(choice)
    choice.each do |k,v|
      self[k].value v unless v.blank?
    end
    drills.each_value do |d|
      d.value :unset unless d.valid_choice?
    end
    autodrill!
  end

  def autodrill!
    #Sometimes when a bunch of drills are specified,
    #this is enough to specify values for some more of them
    # list drills given in params, merged with values autopicked by amee driller
    picks=amee_drill.selections
    picks.each do |path,value|
      drill_by_path(path).value value
    end
  end

  def next_drill
    unset_drills.values.first
  end

  def future_drills
    unset_drills.values[1..-1] || []
  end

  def inspect
    "#{label} : [#{contents.values.map{|x| x.inspect}.join(',')}]"
  end
end

class CalculationSet
  def initialize(options={},&block)
    @calculations={}
    instance_eval(&block) if block
  end
  attr_accessor :calculations
  def [](sym)
    @calculations[sym.to_sym]
  end
  def calculation(options={},&block)
    new_content=Calculation.new(options,&block)
    @calculations[new_content.label]=new_content
  end
end

class Term
  def initialize(options={},&block)
    @parent=options[:parent]
    @value=:unset
    instance_eval(&block) if block
  end
  attr_accessor :parent
  attr_property :label,:name,:path,:value,:type,:validation,:unit,:other_acceptable_units,:default
  def value_if_given
    set? ? value : nil
  end
  def set?
    value!=:unset
  end
  def siblings
    parent.contents_class(self.class)
  end
  def chosen_siblings
    parent.chosen_contents_class(self.class)
  end
  def unset_siblings
    parent.unset_contents_class(self.class)
  end
  def earlier_siblings
    parent.earlier_contents_class(self.class)
  end
  def next?
    label==unset_siblings.values.first.label
  end
  def unset_others
    ActiveSupport::OrderedHash[parent.unset_contents_class(self.class).reject{|k,v|
        k==label
      }]
  end
  
  def inspect
    "[#{self.class} #{label} : #{value}]"
  end
end

class Drill < Term
  def choices
    c=calculation_with_only_earlier.amee_drill.choices
    c.length==1 ? [value] : c #Intention is to get autodrilled, drill will result in a UID
  end
  def calculation_with_only_earlier
    res=parent.clone
    res.unset_this_and_after!(self.class,self.label)
    return res
  end
  def valid_choice?
    (choices.include? value) && (choices.length > 1)
  end
  def options_for_select
    ([nil]+choices).map{|x|[x,x.nil? ? :unset : x]}
  end
  def disabled?
    !set? && !next?
  end
end

class Profile < Term

end

class Output < Term
  
end
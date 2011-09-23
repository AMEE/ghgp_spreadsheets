class CalculationController < ApplicationController

  acts_as_amee_calculator :calculation_set => Proc.new {
    require "#{RAILS_ROOT}/config/calculations.rb"
    Calculations
  }

  before_filter :login_required
  before_filter :initialize_prototype_calculations

  MINIMUM_TABLE_SIZE_IN_ROWS = 8

  def summary
    @title = 'Emissions summary'
    @prototype_outputs = prototype_outputs_in_order
    @headers = ["Calculation methodology"]
    @prototype_outputs.each { |output| @headers << output.name }
    @table = @prototype_calculations.map do |label,calc|
      array = [calc]
      @prototype_outputs.each do |ghg|
        array << nil
      end
      array
    end
  end

  def update_summary
    @prototype_outputs = prototype_outputs_in_order
    @headers = ["Calculation methodology"]
    @prototype_outputs.each { |output| @headers << output.name }
    @table = ghg_totals_by_calculation(@prototype_outputs)
    @all_calculations = @calculation_set.all_ongoing_calculations
    @totals = ghg_totals(@all_calculations,@prototype_outputs)
    render 'update_totals.rjs'
  end

  def report
    @prototype_outputs = prototype_outputs_in_order
    @headers = ["Calculation methodology"]
    @prototype_outputs.each { |output| @headers << output.name }
    @table = ghg_totals_by_calculation(@prototype_outputs)
    @all_calculations = @calculation_set.all_ongoing_calculations
    @totals = ghg_totals(@all_calculations,@prototype_outputs)
    render 'report', :layout => 'report'
  end
  
  def calculation
    type = params[:type].to_sym
    unless defined?(session[type][:show_optional])
      session[type] = { :show_optional => false }
    end
    @calculations = find_all_by_type(type, :minimum => MINIMUM_TABLE_SIZE_IN_ROWS)
    @prototype_calculation = CalculationController.calculation_set.calculations[type]
    @title = @prototype_calculation.name
    render :partial => 'calculation', :layout=> 'application'
  end

  def add
    @calculation = initialize_calculation(params[:type])
  end

  def delete
    if @calculation = find_calculation_by_id(params[:id])
      @calculation.delete
    end
    @row_id = params[:row]
    @calculations = find_all_by_type(@calculation.label)
    @prototype_calculation = @prototype_calculations[@calculation.label]
    render 'delete.rjs'
  end

  def update
    if id = params['id']
      @calculation = find_calculation_by_id(id)
    else
      @calculation = initialize_calculation(params['type'])
    end
    unless @calculation.choose({ params['path'] => { params['attribute'] => params['data']}} )
      @calculation.clear_invalid_terms!
    end
    @calculation.calculate!
    @calculation.save
    @calculations = find_all_by_type(@calculation.label)
    @prototype_calculation = @prototype_calculations[@calculation.label]
    @row_id = params['row']
    if params['id'].nil? || (@calculation[params['path'].to_sym].is_a? AMEE::DataAbstraction::Drill)
      render 'update_row.rjs'
    else
      render 'update_results.rjs'
    end
  end

  def toggle_optional
    type = params[:type].to_sym
    if params[:show_optional] == 'true'
      session[type] = { :show_optional => true }
    end
    if params[:show_optional] == 'false'
      session[type] = { :show_optional => false }
    end
    @calculations = find_all_by_type(type, :minimum => MINIMUM_TABLE_SIZE_IN_ROWS)
    @prototype_calculation = @prototype_calculations[type]
    @title = @prototype_calculation.name
    render 'update.rjs'
  end

  def sort
    type = params[:type].to_sym
    @calculations = find_all_by_type(type)
    @prototype_calculation = @prototype_calculations[type]
    @title = @prototype_calculation.name
    @calculations = @calculations.sort_by!(params[:ascending].to_sym) if params[:ascending]
    @calculations = @calculations.sort_by!(params[:descending].to_sym).reverse! if params[:descending]
    if @calculations.size < MINIMUM_TABLE_SIZE_IN_ROWS
      (MINIMUM_TABLE_SIZE_IN_ROWS - @calculations.size).times do
        @calculations << initialize_calculation(type)
      end
    end
    render 'update.rjs'
  end

  protected

  def initialize_prototype_calculations
    @calculation_set = CalculationController.calculation_set
    @prototype_calculations = @calculation_set.calculations
  end

  def prototype_outputs_in_order
    prototype_outputs = AMEE::DataAbstraction::CalculationCollection.new(@prototype_calculations.values).terms.outputs.visible.first_of_each_type
    co2e_output = prototype_outputs.find {|output| output.label == :co2e} || AMEE::DataAbstraction::Output.new {label :co2e; name 'CO2e'}
    prototype_outputs.delete_if {|output| output.label == :co2e}
    prototype_outputs << co2e_output
    return prototype_outputs.compact
  end

  def ghg_totals_by_calculation(outputs)
    totals = @prototype_calculations.map do |label,calc|
      calcs = AMEE::DataAbstraction::OngoingCalculation.find_by_type(:all, label.to_s, :include => 'terms')
      array = [calc]
      if calcs.empty?
        (outputs.size).times { array << nil }
      else
        outputs.each do |ghg|
          next if ghg.label == :co2e
          array << ( calc[ghg.label] ? calcs.send(ghg.label).sum : nil)
        end
        array << calcs.co2_or_co2e_outputs.sum
      end
      array
    end
    return totals
  end

  def ghg_totals(calculations,outputs)
    totals = AMEE::DataAbstraction::TermsList.new
    outputs.each do |output|
      next if output.label == :co2e
      if calculations.respond_to?(output.label)
        totals << calculations.send(output.label).sum
      else
        totals << AMEE::DataAbstraction::Result.new { name output.name; label output.label; value 0.0}
      end
    end
    totals << co2e_sum = calculations.co2_or_co2e_outputs.sum and co2e_sum.label(:co2e) and co2e_sum.name('CO2e')
    return totals
  end

end

module AMEE
  module DataAbstraction

    # Mixin module for the <i>AMEE::DataAbstraction::Term</i> class, providing
    # methods for handling collections of calculations.
    #
    class TermsList

      def sort_by(attr)

        # 1. Remove unset terms before sort and append at end
        #
        # 2. Establish set terms
        #
        # 3. Zip together with corresponding standardized units list creating a
        # list of Term pairs
        #
        # 4. Sort list according to standardized Terms
        #
        # 5. Return map of original (now sorted) Terms

        unset_terms, set_terms = self.partition { |term| term.unset? || term.value.nil? }
        standardized_set_terms = TermsList.new(set_terms).standardize_units
        ordered_set_terms = set_terms.zip(standardized_set_terms).sort! do |term,other_term|
          term[1].send(attr) <=> other_term[1].send(attr)
        end.map {|term_array| term_array[0]}
        TermsList.new(ordered_set_terms + unset_terms)
      end

      def standardize_units(unit=nil,per_unit=nil)
        return self if homogeneous? and ((unit.nil? or (first.unit and first.unit.label == unit)) and
           (per_unit.nil? or (first.per_unit and first.per_unit.label == per_unit)))
        unit = predominant_unit if unit.nil?
        per_unit = predominant_per_unit if per_unit.nil?
        new_terms = map { |term| term.convert_unit(:unit => unit, :per_unit => per_unit) }
        TermsList.new new_terms
      end
    end
  end
end
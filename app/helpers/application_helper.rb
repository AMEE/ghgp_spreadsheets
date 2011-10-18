
module ApplicationHelper

  def admin_login_required
    unless current_user.admin
      store_location
      flash[:notice] = "You must be an admin user in to access this page"
      redirect_to user_path(current_user)
      return false
    end
  end
  
end

class AMEE::DataAbstraction::CalculationSet

  def all_ongoing_calculations
    ongoing_calculations_by_type.values.inject(AMEE::DataAbstraction::CalculationCollection.new) do |coll,calcs|
      coll += calcs
    end
  end

  def ongoing_calculations_by_type
    hash ={}
    calculations.each do |label,proto|
      hash[label] = AMEE::DataAbstraction::OngoingCalculation.find_by_type(:all, label.to_s, :include => 'terms')
    end
    return hash
  end

end

class AMEE::DataAbstraction::CalculationSet
  def generate_lock_file(output_path=nil)
        file = output_path || lock_file_path or raise ArgumentError,
          "No path for lock file known. Either set path for the master config file using the #file accessor method or provide as an argument"
        string = ""
        @calculations.values.each do |prototype_calculation|
          string += "calculation {\n\n"
          string += "  name \"#{prototype_calculation.name}\"\n"
          string += "  label :#{prototype_calculation.label}\n"
          string += "  path \"#{prototype_calculation.path}\"\n\n"
          prototype_calculation.terms.each do |term|
            string += "  #{term.class.to_s.split("::").last.downcase} {\n"
            string += "    name \"#{term.name}\"\n" unless term.name.blank?
            string += "    label :#{term.label}\n" unless term.label.blank?
            string += "    path \"#{term.path}\"\n" unless term.path.blank?
            string += "    value \"#{term.value}\"\n" unless term.value.blank?

            if term.is_a?(AMEE::DataAbstraction::Input)
              string += "    fixed \"#{term.value}\"\n" if term.fixed? && !term.value.blank?
              if term.is_a?(AMEE::DataAbstraction::Drill)
                string += "    choices \"#{term.choices.join('\",\"')}\"\n" if term.instance_variable_defined?("@choices")  && !term.choices.blank?
              elsif term.is_a?(AMEE::DataAbstraction::Profile)
                string += "    choices [\"#{term.choices.join('\",\"')}\"]\n" if term.instance_variable_defined?("@choices")  && !term.choices.blank?
              end
              string += "    optional!\n" if term.optional?
            end

            string += "    default_unit :#{term.default_unit.label}\n" unless term.default_unit.blank?
            string += "    default_per_unit :#{term.default_per_unit.label}\n" unless term.default_per_unit.blank?
            string += "    alternative_units :#{term.alternative_units.map(&:label).join(', :')}\n" unless term.alternative_units.blank?
            string += "    alternative_per_units :#{term.alternative_per_units.map(&:label).join(', :')}\n" unless term.alternative_per_units.blank?
            string += "    unit :#{term.unit.label}\n" unless term.unit.blank?
            string += "    per_unit :#{term.per_unit.label}\n" unless term.per_unit.blank?
            string += "    type :#{term.type}\n" unless term.type.blank?
            string += "    interface :#{term.interface}\n" unless term.interface.blank?
            string += "    note \"#{term.note}\"\n" unless term.note.blank?
            string += "    disable!\n" if !term.is_a?(AMEE::DataAbstraction::Drill) && term.disabled?
            string += "    hide!\n" if term.hidden?
            string += "  }\n\n"
          end
          string += "}\n\n"
        end
        File.open(file,'w') { |f| f.write string }
      end
end
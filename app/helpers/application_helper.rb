
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

  def ongoing_calculations_for(type)
    AMEE::DataAbstraction::OngoingCalculation.find_by_type(:all, type.to_s, :include => 'terms')
  end

end

module AMEE
  module DataAbstraction

    class Input

      def optional!
        @optional=true
      end

      def compulsory!
        @optional=false
      end
    end
  end
end

module AMEE
  module DataAbstraction

    class Term
      [:unit,:per_unit].each do |field|
        define_method("alternative_#{field}s") do |*args|
          ivar = "@alternative_#{field}s"
          unless args.empty?
            units = args.map {|arg| Unit.for(arg) }
            Term.validate_dimensional_equivalence?(*units)
            instance_variable_set(ivar, units)
          else
            return instance_variable_get(ivar) if instance_variable_get(ivar)
            default = send("default_#{field}".to_sym)
            return instance_variable_set(ivar, (default.alternatives)) if default
          end
        end

        define_method("#{field}_choices") do |*args|
          choices = send("alternative_#{field}s".to_sym)
          default = send("default_#{field}".to_sym)
          choices = [default] + choices if default
          return choices
        end
      end
    end
  end
end
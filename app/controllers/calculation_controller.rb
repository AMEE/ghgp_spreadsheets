class CalculationController < ApplicationController

  acts_as_amee_calculator

  def index
    @prototype_calculations = Calculations.calculations
    if params[:type]
      if params[:type] == 'summary'
        @all = {}
        @prototype_calculations.each do |label, calc|
          @all[calc.name] = find_all_by_type(label)
        end
        render 'totals.rjs'
      else
        type = params[:type].to_sym
        unless defined?(session[type][:show_optional])
          session[type] = { :show_optional => false }
        end
        @optional = session[type][:show_optional]
        if params[:show_optional] == 'true'
          session[type] = { :show_optional => true }
          @optional = true
        end
        if params[:show_optional] == 'false'
          session[type] = { :show_optional => false }
          @optional = false
        end
        @prototype_calculation = @prototype_calculations[type]
        @calculations = find_all_by_type(type)
        render 'calculation.rjs'
      end
    else
      # home/introduction page
    end
  end

  def add
    @calculation = initialize_calculation(params[:type])
  end

  def delete
    if @calculation = find_calculation_by_id(params[:id])
      @calculation.delete
    end
    redirect_to :action => 'index', :type => @calculation.label
  end

  def update
    if id = params['entry']['id']
      @calculation = find_calculation_by_id(id)
    else
      @calculation = initialize_calculation(params['calculation'])
    end
    unless @calculation.choose(params['entry'])
      @calculation.clear_invalid_terms!
    end
    @calculation.calculate!
    @calculation.save
    redirect_to :action => 'index', :type => @calculation.label
  end

end

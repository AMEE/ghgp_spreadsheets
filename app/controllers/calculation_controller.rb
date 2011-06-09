class CalculationController < ApplicationController

  acts_as_amee_calculator

  CALCULATION_ORDER = [:default_co2, :soderberg, :prebake, :pitchcook_default_tar, :pitchcook_default_anode,
                       :alternative, :coke, :soda_ash, :lime, :default_pfc, :slope_pfc, :overvoltage_pfc ]

  def index
    @prototype_calculations = ordered_prototype_calcs(Calculations)
    if params[:type]
      if params[:type] == 'summary'
        @all = @prototype_calculations.map do |calc|
          find_all_by_type(calc.label)
        end
        render 'totals.rjs'
      else
        type = params[:type].to_sym
        unless defined?(session[type][:show_optional])
          session[type] = { :show_optional => false }
        end
        if params[:show_optional] == 'true'
          session[type] = { :show_optional => true }
        end
        if params[:show_optional] == 'false'
          session[type] = { :show_optional => false }
        end
        @calculations = find_all_by_type(type)
        if @calculations.size < 5
          (5 - @calculations.size).times do
            @calculations << initialize_calculation(type)
          end
        end
        @prototype_calculation = Calculations.calculations[type]
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

  def ordered_prototype_calcs(set)
    CALCULATION_ORDER.map { |label| set.send(:calculations)[label] }
  end

end

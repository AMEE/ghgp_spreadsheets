class CalculationController < ApplicationController

  acts_as_amee_calculator :calculation_set => Calculations
  
  def intro
    @prototype_calculations = @@calculation_set.calculations
  end

  def totals
    @prototype_calculations = @@calculation_set.calculations
    @sums = @prototype_calculations.map do |label,calc|
      calcs = find_all_by_type(label)
      unless calcs.empty?
        sum = (calcs.first.outputs.labels.include?(:co2) ? calcs.co2.sum : calcs.co2e.sum)
      end
      [calc,sum]
    end
    all_sums = @sums.map(&:last).compact
    @sum = ( all_sums.empty? ? nil : AMEE::DataAbstraction::TermsList.new(all_sums).sum )
  end

  def calculation
    type = params[:type].to_sym
    unless defined?(session[type][:show_optional])
      session[type] = { :show_optional => false }
    end
    @prototype_calculations = @@calculation_set.calculations
    @options = options_for_calculation(type)
    render :partial => 'calculation', :locals => @options, :layout=> 'application'
  end

  def add
    @calculation = initialize_calculation(params[:type])
  end

  def delete
    if @calculation = find_calculation_by_id(params[:id])
      @calculation.delete
    end
    @options = options_for_calculation(@calculation)
    render 'update.rjs'
  end

  def update
    if id = params['entry']['id']
      @calculation = find_calculation_by_id(id)
    else
      @calculation = initialize_calculation(params['type'])
    end
    unless @calculation.choose(params['entry'])
      @calculation.clear_invalid_terms!
    end
    @calculation.calculate!
    @calculation.save
    @options = options_for_calculation(@calculation)
    render 'update.rjs'
  end

  def toggle_optional
    type = params[:type].to_sym
    if params[:show_optional] == 'true'
      session[type] = { :show_optional => true }
    end
    if params[:show_optional] == 'false'
      session[type] = { :show_optional => false }
    end
    @options = options_for_calculation(type)
    render 'update.rjs'
  end

  def sort
    @options = options_for_calculation(params[:type].to_sym)
    @options[:calculations] = @options[:calculations].sort_by!(params[:ascending].to_sym) if params[:ascending]
    @options[:calculations] = @options[:calculations].sort_by!(params[:descending].to_sym).reverse! if params[:descending]
    render 'update.rjs'
  end
  
  private

  MINIMUM_TABLE_SIZE_IN_ROWS = 5

  def options_for_calculation(type_or_calculation)
    type_or_calculation = type_or_calculation.label if type_or_calculation.is_a? AMEE::DataAbstraction::OngoingCalculation
    hash = {}
    hash[:calculations] = find_all_by_type(type_or_calculation, :minimum => MINIMUM_TABLE_SIZE_IN_ROWS)
    hash[:prototype_calculation] = @@calculation_set.calculations[type_or_calculation]
    return hash
  end

end

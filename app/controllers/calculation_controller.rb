class CalculationController < ApplicationController

  acts_as_amee_calculator :calculation_set => Proc.new {
    require "#{RAILS_ROOT}/config/calculations.rb"
    Calculations
  }

  before_filter :login_required
  before_filter :initialize_prototype_calculations
  helper_method :output_terms_in_order, :calculation_terms_in_table_order

  MINIMUM_TABLE_SIZE_IN_ROWS = 8

  def summary
    @title = 'Emissions summary'
    @prototype_outputs = prototype_outputs_in_order
    @headers = @prototype_outputs.map { |output| output.name }.unshift("Calculation methodology")
    @table = @prototype_calculations.map do |label,calc|
      @prototype_outputs.map { |ghg| nil }.unshift(calc)
    end
  end

  def update_summary
    generate_summary_data
  end

  def report
    generate_summary_data
    render 'report', :layout => 'report'
  end

  def generate_summary_data
    @prototype_outputs = prototype_outputs_in_order
    @headers = @prototype_outputs.map { |output| output.name }.unshift("Calculation methodology")
    @table = ghg_totals_by_calculation(@prototype_outputs)
    @all_calculations = @calculation_set.all_ongoing_calculations
    @totals = ghg_totals(@all_calculations,@prototype_outputs)
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
      @calculation.autodrill
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
    prototype_outputs << AMEE::DataAbstraction::Output.new {label :co2e; name 'CO2e'} unless prototype_outputs.any? {|output| output.label == :co2e}
    output_terms_in_order(prototype_outputs)
  end

  def calculation_terms_in_table_order(calculation,include_optional=false,include_outputs=true)
    terms = []
    terms = terms + calculation.metadata.visible
    terms += calculation.drills.visible
    terms += calculation.profiles.compulsory.visible
    terms += calculation.profiles.optional.visible if include_optional
    terms += output_terms_in_order(calculation.outputs.visible) if include_outputs
    return terms
  end

  def output_terms_in_order(outputs)
    outputs.sort! {|output,next_output| output.label.to_s <=> next_output.label.to_s}
    outputs.move_by(:label,:co2,0)
    outputs.move_by(:label,:co2e,0) and outputs.rotate
    return outputs
  end

  def ghg_totals_by_calculation(outputs)
    totals = @prototype_calculations.map do |label,calc|
      calcs = AMEE::DataAbstraction::OngoingCalculation.find_by_type(:all, label.to_s, :include => 'terms')
      array = [calc]
      if calcs.empty?
        (outputs.size).times { array << nil }
      else
        outputs.each do |ghg|
          if ghg.label == :co2e
            array << calcs.co2_or_co2e_outputs.sum
          else
            array << ( calc[ghg.label] ? calcs.send(ghg.label).sum : nil)
          end
        end
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
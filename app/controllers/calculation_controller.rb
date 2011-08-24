class CalculationController < ApplicationController

  acts_as_amee_calculator :calculation_set => Proc.new {
    require "#{RAILS_ROOT}/config/calculations.rb"
    Calculations
  }

  before_filter :login_required
  before_filter :initialize_prototype_calculations

  MINIMUM_TABLE_SIZE_IN_ROWS = 10

  def initialize_prototype_calculations
    @calculation_set = CalculationController.calculation_set
    @prototype_calculations = @calculation_set.calculations
  end

  def summary
    @title = 'Emissions summary'
    @prototype_outputs = AMEE::DataAbstraction::CalculationCollection.new(@prototype_calculations.values).terms.outputs.visible.first_of_each_type
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

  def update_totals
    @prototype_outputs = AMEE::DataAbstraction::CalculationCollection.new(@prototype_calculations.values).terms.outputs.visible.first_of_each_type
    @headers = ["Calculation methodology"]
    @prototype_outputs.each { |output| @headers << output.name }
    @table = @prototype_calculations.map do |label,calc|
      calcs = AMEE::DataAbstraction::OngoingCalculation.find_by_type(:all, label.to_s, :include => 'terms')
      array = [calc]
      if calcs.empty?
        (@prototype_outputs.size).times { array << nil }
      else
        @prototype_outputs.each do |ghg|
          next if ghg.label == :co2e
          array << ( calc[ghg.label] ? calcs.send(ghg.label).sum : nil)
        end
        array << calcs.co2_or_co2e_outputs.sum
      end
      array
    end
    @all_calculations = @calculation_set.all_ongoing_calculations
    @totals = AMEE::DataAbstraction::TermsList.new
    @prototype_outputs.each do |output|
      next if output.label == :co2e
      if @all_calculations.respond_to?(output.label)
        @totals << @all_calculations.send(output.label).sum
      else
        @totals << AMEE::DataAbstraction::Result.new { name output.name; label output.label; value 0.0}
      end
    end
    co2e_sum = @all_calculations.co2_or_co2e_outputs.sum
    co2e_sum.label :co2e
    @totals << co2e_sum
    render 'update_totals.rjs'
  end

  def report
    @prototype_outputs = AMEE::DataAbstraction::CalculationCollection.new(@prototype_calculations.values).terms.outputs.visible.first_of_each_type
    @headers = ["Calculation methodology"]
    @prototype_outputs.each { |output| @headers << output.name }
    @table = @prototype_calculations.map do |label,calc|
      calcs = AMEE::DataAbstraction::OngoingCalculation.find_by_type(:all, label.to_s, :include => 'terms')
      array = [calc]
      if calcs.empty?
        (@prototype_outputs.size).times { array << nil }
      else
        @prototype_outputs.each do |ghg|
          next if ghg.label == :co2e
          array << ( calc[ghg.label] ? calcs.send(ghg.label).sum : nil)
        end
        array << calcs.co2_or_co2e_outputs.sum
      end
      array
    end
    @all_calculations = @calculation_set.all_ongoing_calculations
    @totals = AMEE::DataAbstraction::TermsList.new
    @prototype_outputs.each do |output|
      next if output.label == :co2e
      if @all_calculations.respond_to?(output.label)
        @totals << @all_calculations.send(output.label).sum
      else
        @totals << AMEE::DataAbstraction::Result.new { name output.name; label output.label; value 0.0}
      end
    end
    co2e_sum = @all_calculations.co2_or_co2e_outputs.sum
    co2e_sum.label :co2e
    co2e_sum.name 'CO2e'
    @totals << co2e_sum
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
    @prototype_calculation.terms.each do |term|
      puts term.note
    end
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
    @prototype_calculation = CalculationController.calculation_set.calculations[@calculation.label]
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
    @prototype_calculation = CalculationController.calculation_set.calculations[@calculation.label]
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
    @prototype_calculation = CalculationController.calculation_set.calculations[type]
    @title = @prototype_calculation.name
    render 'update.rjs'
  end

  def sort
    type = params[:type].to_sym
    @calculations = find_all_by_type(type, :minimum => MINIMUM_TABLE_SIZE_IN_ROWS)
    @prototype_calculation = CalculationController.calculation_set.calculations[type]
    @title = @prototype_calculation.name
    @calculations = @calculations.sort_by!(params[:ascending].to_sym) if params[:ascending]
    @calculations = @calculations.sort_by!(params[:descending].to_sym).reverse! if params[:descending]
    render 'update.rjs'
  end

end
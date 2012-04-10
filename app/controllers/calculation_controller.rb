# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

class CalculationController < ApplicationController

  helper CalculationHelper

  before_filter :login_required
  before_filter :initialize_prototype_calculations
  helper_method :output_terms_in_order, :calculation_terms_in_table_order

  MINIMUM_TABLE_SIZE_IN_ROWS = 7

  @@calculation_set = AMEE::DataAbstraction::CalculationSet.find($sheet)

  def summary
    generate_summary_data
  end

  def report
    generate_summary_data
    render 'report', :layout => 'report'
  end
  
  def calculation
    type = params[:type].to_sym

    unless defined?(session[type][:show_optional])
      session[type] = { :show_optional => false }
    end

    @calculations          = find_calculations_by_type(type, :minimum => MINIMUM_TABLE_SIZE_IN_ROWS) and convert_outputs(@calculations)
    @prototype_calculation = @prototype_calculations[type]
    @title                 = @prototype_calculation.name

    render '_calculation'
  end

  def add
    @calculation = initialize_calculation(params[:type])
    @calculation.outputs.each do |output|
      @calculation.contents[output.label.to_sym] = output.convert_unit(:unit => current_user.return_unit)
    end
  end

  def delete
    if @calculation = find_calculation_by_id(params[:id])
      @calculation.delete
    end
    @row_id = params[:row]
    @calculations = find_calculations_by_type(@calculation.label)
    convert_outputs(@calculations)

    @prototype_calculation = @prototype_calculations[@calculation.label]
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
    @calculations = find_calculations_by_type(@calculation.label)
    @calculation.outputs.each do |output|
      @calculation.contents[output.label.to_sym] = output.convert_unit(:unit => current_user.return_unit)
    end
    convert_outputs(@calculations)
    @prototype_calculation = @prototype_calculations[@calculation.label]
    @row_id = params['row']

    if params['id'].nil? || (@calculation[params['path'].to_sym].is_a? AMEE::DataAbstraction::Drill)
      render 'update_row.js'
    else
      render 'update_results.js'
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

    @calculations          = find_calculations_by_type(type, :minimum => MINIMUM_TABLE_SIZE_IN_ROWS) and convert_outputs(@calculations)
    @prototype_calculation = @prototype_calculations[type]
    @title                 = @prototype_calculation.name

    render 'update.js'
  end

  def sort
    type = params[:type].to_sym

    @calculations          = find_calculations_by_type(type) and convert_outputs(@calculations)
    @prototype_calculation = @prototype_calculations[type]
    @title                 = @prototype_calculation.name

    @calculations = @calculations.sort_by!(params[:ascending].to_sym) if params[:ascending]
    @calculations = @calculations.sort_by!(params[:descending].to_sym).reverse! if params[:descending]

    if @calculations.size < MINIMUM_TABLE_SIZE_IN_ROWS
      (MINIMUM_TABLE_SIZE_IN_ROWS - @calculations.size).times do
        @calculations << initialize_calculation(type)
      end
    end

    render 'update.js'
  end

  protected

  def self.calculation_set
    class_variable_get("@@calculation_set")
  end

  def calculation_set
    CalculationController.calculation_set
  end

  # Find a specific calcualtion on the basis of it's database reference
  def find_calculation_by_id(id)
    AMEE::DataAbstraction::OngoingCalculation.find(id.to_i, :include => 'terms')
  end

  # Find all stored calculations for a particular calculation type. First
  # argument must represent the label (string or symbol) of the calcualtion
  # type. Two other options can be specified as a hash.
  #
  # :minimum => <an integer> #=> Returns the specified minumim number
  # of calculations. If the number of
  # retrieved calculations is smaller
  # than the minimum, the number is made
  # up by initializing blank calculations
  #
  # :calculation_set => <instance of AMEE::DataAbstraction::CalculationSet>
  #
  # #=> Specifies the calculation set within
  # which to find the calculation type
  # required. This is only required if
  # a minimum requirement is specified
  # AND the calculation set is NOT declared
  # at the controller level (see the
  # controller class methods, above).
  #
  #
  def find_calculations_by_type(label,options={})
    collection = AMEE::DataAbstraction::OngoingCalculation.find_by_type(:all, label.to_s, :include => 'terms')
    if options[:minimum] and collection.size < options[:minimum]
      (options[:minimum] - collection.size).times do
        collection << initialize_calculation(label)
      end
    end
    return collection
  end

  # Initialize a new calculation of a type specified by the first argument.
  # This argument should represent the label of the prototype caluclation
  # required. The calculation set within which the prototype calculation can
  # be found should be passed as a second argument unless this is defined at
  # the controller level (see controller class methods, above).
  #
  def initialize_calculation(label)
    label = label.to_sym unless label.is_a? Symbol
    if calculation_set
      calculation_set[label].begin_calculation
    else
      raise ArgumentError, "CalculationSet for controller not defined. Must specify at controller level or provide as second argument."
    end
  end

  def initialize_prototype_calculations
    @calculation_set        = calculation_set
    @prototype_calculations = @calculation_set.calculations
  end

  def prototype_outputs_in_order
    prototype_outputs = AMEE::DataAbstraction::CalculationCollection.new(@prototype_calculations.values).terms.outputs.visible.first_of_each_type
    prototype_outputs << AMEE::DataAbstraction::Output.new {label :co2e; name 'CO2e'} unless prototype_outputs.any? {|output| output.label == :co2e}
    output_terms_in_order(prototype_outputs)
  end

  def calculation_terms_in_table_order(calculation,include_optional=false,include_outputs=true)
    terms  = []
    terms  = terms + calculation.metadata.visible
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

  def convert_outputs(collection)
    return collection if current_user.return_unit == 'kg' || collection.empty?
    outputs = [collection.outputs.visible.first_of_each_type.labels].flatten
    outputs.each do |output|
      collection.standardize_units!(output.to_sym, current_user.return_unit) if collection.respond_to?(output.to_sym)
    end
  end

  def generate_summary_data
    @prototype_outputs = prototype_outputs_in_order
    @headers           = @prototype_outputs.map { |output| output.name }.unshift("Calculation methodology")
    @table             = ghg_totals_by_calculation(@prototype_outputs)
    @all_calculations  = @calculation_set.all_ongoing_calculations
    @totals            = ghg_totals(@all_calculations,@prototype_outputs)
  end

  def ghg_totals_by_calculation(outputs)
    totals = @prototype_calculations.map do |label,calc|
      calcs = AMEE::DataAbstraction::OngoingCalculation.find_by_type(:all, label.to_s, :include => 'terms')
      array = [calc]
      if calcs.empty?
        (outputs.size).times { array << nil }
      else
        convert_outputs(calcs)
        outputs.each do |ghg|
          if ghg.label == :co2e
            array << calcs.co2_or_co2e_outputs.sum
          else
            array << (calc[ghg.label] ? calcs.send(ghg.label).sum : nil)
          end
        end
      end
      array
    end
    return totals
  end

  def ghg_totals(calculations,outputs)
    convert_outputs(calculations)
    totals = AMEE::DataAbstraction::TermsList.new
    outputs.each do |output|
      next if output.label == :co2e
      if calculations.respond_to?(output.label)
        totals << calculations.send(output.label).sum
      else
        totals << AMEE::Analytics::Result.new { name output.name; label output.label; value 0.0}
      end
    end
    totals << co2e_sum = calculations.co2_or_co2e_outputs.sum and co2e_sum.label(:co2e) and co2e_sum.name('CO2e')
    return totals
  end

end
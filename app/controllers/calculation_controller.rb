class CalculationController < ApplicationController
  def index
    @existing={}
    Calculations.calculations.keys.each do |label|
      @existing[label] = AMEE::DataAbstraction::OngoingCalculation.find(:all,:conditions=>{:calculation_type=>label.to_s})
    end
  end

  def enter
    @calculation=Calculations[params[:calculation]].begin_calculation
  end

  def result
    @calculation=Calculations[params[:calculation]].begin_calculation
    @calculation.choose!(params['entry'])   
    @calculation.calculate!
    @calculation.save if @calculation.satisfied?
  end

  def edit
    @calculation= AMEE::DataAbstraction::OngoingCalculation.
      find(:first,:conditions=>{:profile_item_uid=>params[:uid]})
    @calculation.calculate!
  end
  
end

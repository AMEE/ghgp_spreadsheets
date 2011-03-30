class CalculationController < ApplicationController
  def index
    @available=Calculations.calculations.values
    @existing = AMEE::DataAbstraction::OngoingCalculation.find(:all)
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

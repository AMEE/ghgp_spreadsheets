class CalculationController < ApplicationController
  def index
    @calculations=Calculations.calculations.values
    @loaded_calc = AMEE::DataAbstraction::OngoingCalculation.find(:first)
    @loaded_calc.save
  end

  def enter
    @calculation=Calculations[params[:calculation]].begin_calculation
  end

  def result
    @calculation=Calculations[params[:calculation]].begin_calculation
    @calculation.choose!(params['entry'])   
    @calculation.calculate!
  end
  
end

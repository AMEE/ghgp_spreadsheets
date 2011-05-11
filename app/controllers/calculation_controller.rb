class CalculationController < ApplicationController
  def index
    @existing={}
    Calculations.calculations.keys.each do |label|
      @existing[label] = AMEE::DataAbstraction::OngoingCalculation.find_by_type(:all,label.to_s)
    end
  end

  def enter
    @calculation=Calculations[params[:calculation]].begin_calculation
  end

  def result
    if params['entry']['id']
      @calculation=AMEE::DataAbstraction::OngoingCalculation.find(params['entry']['id'].to_i)
    else
      @calculation=Calculations[params[:calculation]].begin_calculation
    end
    unless @calculation.choose(params['entry'])
      @calculation.clear_invalid_terms!
    end
    @calculation.calculate!
    @calculation.save if @calculation.satisfied?
  end

  def edit
    @calculation= AMEE::DataAbstraction::OngoingCalculation.
      find(params[:id])
    @calculation.calculate!
  end

  def delete
    @calculation= AMEE::DataAbstraction::OngoingCalculation.
      find(params[:id])
    @calculation.delete
  end

end

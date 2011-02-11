class CalculationController < ApplicationController
  def index
    @calculations=Calculations.values
  end

  def enter
    @calculation=Calculations[params[:calculation]]
  end

  def result
    @calculation=Calculations[params[:calculation]].clone
    @calculation.choose!(params['entry'])
    Rails.logger.debug(@calculation.satisfied?)
    Rails.logger.debug(@calculation.unset_drills)
    @calculation.calculate!
    Rails.logger.debug(@calculation.inspect)
    
  end
  
end


require 'quantify'
 
Quantify::Unit::NonSI.configure do

  # Differentiate gallon symbols
  Unit.gal.configure_as_canonical do |unit|
    unit.symbol = 'gal (US)'
  end

  Unit.gallon_dry_us.configure_as_canonical do |unit|
    unit.symbol = 'gal (US dry)'
  end

  Unit.gal_uk.configure_as_canonical do |unit|
    unit.symbol = 'gal (UK)'
  end

end
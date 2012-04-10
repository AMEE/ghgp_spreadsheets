# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.


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

  Unit.oz_fl.configure_as_canonical do |unit|
    unit.symbol = 'fl oz (US)'
  end

  Unit.oz_fl_uk.configure_as_canonical do |unit|
    unit.symbol = 'fl oz (UK)'
  end

end
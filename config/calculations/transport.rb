# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

all_calculations {
  metadatum {
    name 'Source description'
    label :source_description
    interface :text_box
    note "Provide a description for the transport emissions source under consideration"
    type 'string'
  }

  # Correct titles for outputs
  correcting(:co2)     { name "CO2";  note "CO2 emissions calculated based on data entered for each scenario"}
  correcting(:co2e)    { name "CO2e"; note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"}
  correcting(:ch4)     { name "CH4";  note "CH4 emissions calculated based on data entered for each scenario."}
  correcting(:n2_o)    { name "N2O";  note "N2O emissions calculated based on data entered for each scenario."}

  correcting(:bio_co2) { hide! }
  correcting (:comment) { hide! }

}

calculation {
  name "Fuel consumption"
  label :transport_fuel
  path "/transport/ghgp/fuel"
  terms_from_amee 'default'
  
  metadatum {
    label :note
    value "This methodology enables the calculation of CO2 emissions associated with the mobile combustion of fuels on the basis of fuel quantity."
    hide!
  }

  correcting(:fuel)    {note "Select the type of fuel consumed."}
  correcting(:region)  {note "Select the specific regional context in which fuel consumption occurred."}
  correcting(:volume)  {note "Specify the quantity of fuel consumed."}

}

calculation {
  name "UK road vehicles"
  label :uk_road_vehicles
  path "/transport/ghgp/vehicle/uk"
  terms_from_amee 'default'

  metadatum {
    label :note
    value "This methodology enables the calculation of CO2 emissions associated with UK road vehicles"
    hide!
  }

  correcting(:co2e) { hide! }
  
  correcting(:type)      {note "Select the type of vehicle under consideration."}
  correcting(:fuel)      {note "Select the type of fuel used by the vehicle."}
  correcting(:size)      {note "Select the size class of vehicle under consideration."}
  correcting(:distance)  {note "Specify the total distance travelled. This can represent one or multiple journeys."}
  correcting(:occupancy) {note "Specify the vehicle occupancy. This is used to convert total vehiclular emissions into per passenger emissions. If only total vehicular emissions are required, this value can be ignored."}

}

calculation {
  name "UK heavy goods vehicles"
  label :uk_heavy_goods_vehicles
  path "/transport/ghgp/vehicle/uk/heavygoods"
  terms_from_amee 'default'

  correcting(:co2e) { hide! }

  metadatum {
    label :note
    value "This methodology enables the calculation of CO2 emissions associated with UK road vehicles"
    hide!
  }

  correcting(:occupancy) { hide! }

  correcting(:type)      {note "Select the type of heavy goods vehicle under consideration."}
  correcting(:size)      {note "Select the size class of heavy goods vehicle under consideration."}
  correcting(:load)      {note "Select the (typical) loading level of the vehicle type under consideration."}
  correcting(:distance)  {note "Specify the total distance travelled. This can represent one or multiple journeys."}

}

calculation {
  name "US road vehicles by fuel"
  label :us_road_vehicles_by_fuel
  path "/transport/ghgp/vehicle/us"
  terms_from_amee 'byFuelOnly'

  metadatum {
    label :note
    value "This methodology enables the calculation of CO2, CH4, N2O and CO2e emissions associated with US road vehicles and on the basis of fuel consumption"
    hide!
  }

  correcting(:type)              {note "Select the type of vehicle(s) under consideration."}
  correcting(:fuel)              {note "Select the type of fuel used by the vehicle(s)."}
  correcting(:emission_standard) {note "Select the emissions abatement technology standard of the vehicle(s) under consideration."}
  correcting(:volume)            {note "Specify the quantity of fuel consumed."}
  correcting(:occupancy)         {note "Specify the (typical) vehicle occupancy. This is used to convert total vehiclular emissions into per passenger emissions. If only total vehicular emissions are required, this value can be ignored."}

}

calculation {
  name "US road vehicles by distance"
  label :us_road_vehicles_by_distance
  path "/transport/ghgp/vehicle/us"
  terms_from_amee 'byDistanceOnly'

  metadatum {
    label :note
    value "This methodology enables the calculation of CO2, CH4, N2O and CO2e and biogenic CO2 emissions associated with US road vehicles and on the basis of distance travelled"
    hide!
  }

  correcting(:type)              {note "Select the type of vehicle(s) under consideration."}
  correcting(:fuel)              {note "Select the type of fuel used by the vehicle(s)."}
  correcting(:emission_standard) {note "Select the emissions abatement technology standard of the vehicle(s) under consideration."}
  correcting(:distance)          {note "Specify the total distance travelled. This can represent one or multiple journeys."}
  correcting(:occupancy)         {note "Specify the (typical) vehicle occupancy. This is used to convert total vehiclular emissions into per passenger emissions. If only total vehicular emissions are required, this value can be ignored."}

}

calculation {
  name "Other regional road vehicles"
  label :other_road_vehicles
  path "/transport/ghgp/vehicle/other"
  terms_from_amee 'default'

  metadatum {
    label :note
    value "This methodology enables the calculation of CO2 and biogenic CO2 emissions associated with road vehicles in non-UK/UK regions."
    hide!
  }

  correcting(:type)              {note "Select the type of vehicle(s) under consideration."}
  correcting(:fuel)              {note "Select the type of fuel used by the vehicle(s)."}
  correcting(:emission_standard) {note "Select the emissions abatement technology standard of the vehicle(s) under consideration."}
  correcting(:distance)          {note "Specify the total distance travelled. This can represent one or multiple journeys."}
  correcting(:occupancy)         {note "Specify the (typical) vehicle occupancy. This is used to convert total vehiclular emissions into per passenger emissions. If only total vehicular emissions are required, this value can be ignored."}

}

calculation {
  name "Passenger transport"
  label :transport_passenger
  path "/transport/ghgp/passenger"
  terms_from_amee 'default'

  metadatum {
    label :note
    value "This methodology enables the calculation of CO2, CH4, N2O and CO2e emissions associated with passenger transport."
    hide!
  }

  correcting(:type)       {note "Select the general mode of passenger transport under consideration."}
  correcting(:subtype)    {note "Select the subtype of passenger transport under consideration."}
  correcting(:class)      {note "Select the passenger class under consideration."}
  correcting(:region)     {note "Select the specific regional context in which travel occurred."}
  correcting(:distance)   {note "Specify the total distance travelled. This can represent one or multiple journeys."}
  correcting(:passengers) {note "Specify the number of passengers under consideration."}

}

calculation {
  name "Freight transport"
  label :transport_freight
  path "/transport/ghgp/freight"
  terms_from_amee 'default'

  metadatum {
    label :note
    value "This methodology enables the calculation of CO2, CH4, N2O and CO2e emissions associated with freight transport."
    hide!
  }

  correcting(:type)     {note "Select the general mode of freight transport under consideration."}
  correcting(:subtype)  {note "Select the subtype of freight transport under consideration."}
  correcting(:size)     {note "Select the size class of freight transport under consideration."}
  correcting(:region)   {note "Select the specific regional context in which freighting occurred."}
  correcting(:distance) {note "Specify the total distance travelled. This can represent one or multiple journeys."}
  correcting(:mass)     {note "Specify the quantity of goods freighted."}

}
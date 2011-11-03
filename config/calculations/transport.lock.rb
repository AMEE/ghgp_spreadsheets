calculation {

  name "Fuel consumption"
  label :transport_fuel
  path "/transport/ghgp/fuel"

  drill {
    name "Fuel type"
    label :fuel
    path "fuel"
    interface :drop_down
    note "Select the type of fuel consumed."
  }

  drill {
    name "Region"
    label :region
    path "region"
    interface :drop_down
    note "Select the specific regional context in which fuel consumption occurred."
  }

  profile {
    name "Volume fuel consumed"
    label :volume
    path "volume"
    default_unit :gal
    alternative_units :m³, :L, :bbl, :bbl_fl_us, :gallon_dry_us, :gal_uk, :oz_fl, :oz_fl_uk
    unit :gal
    type :decimal
    interface :text_box
    note "Specify the quantity of fuel consumed."
  }

  output {
    name "Bio co2"
    label :bio_co2
    path "bioCO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    hide!
  }

  output {
    name "CO2"
    label :co2
    path "CO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2 emissions calculated based on data entered for each scenario"
  }

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology enables the calculation of CO2 emissions associated with the mobile combustion of fuels on the basis of fuel quantity."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Source description"
    label :source_description
    path "source_description"
    type :string
    interface :text_box
    note "Provide a description for the transport emissions source under consideration"
  }

}

calculation {

  name "UK road vehicles"
  label :uk_road_vehicles
  path "/transport/ghgp/vehicle/uk"

  drill {
    name "Vehicle type"
    label :type
    path "type"
    interface :drop_down
    note "Select the type of vehicle under consideration."
  }

  drill {
    name "Fuel type"
    label :fuel
    path "fuel"
    interface :drop_down
    note "Select the type of fuel used by the vehicle."
  }

  drill {
    name "Vehicle size"
    label :size
    path "size"
    interface :drop_down
    note "Select the size class of vehicle under consideration."
  }

  profile {
    name "Distance travelled"
    label :distance
    path "distance"
    default_unit :km
    alternative_units :m, :ft, :in, :mi, :nmi, :yd
    unit :km
    type :decimal
    interface :text_box
    note "Specify the total distance travelled. This can represent one or multiple journeys."
  }

  profile {
    name "Vehicle occupancy"
    label :occupancy
    path "occupancy"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the vehicle occupancy. This is used to convert total vehiclular emissions into per passenger emissions. If only total vehicular emissions are required, this value can be ignored."
  }

  output {
    name "CO2"
    label :co2
    path "CO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2 emissions calculated based on data entered for each scenario"
  }

  output {
    name "CO2e"
    label :co2e
    path "CO2e"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"
    hide!
  }

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology enables the calculation of CO2 emissions associated with UK road vehicles"
    interface :drop_down
    hide!
  }

  metadatum {
    name "Source description"
    label :source_description
    path "source_description"
    type :string
    interface :text_box
    note "Provide a description for the transport emissions source under consideration"
  }

}

calculation {

  name "UK heavy goods vehicles"
  label :uk_heavy_goods_vehicles
  path "/transport/ghgp/vehicle/uk/heavygoods"

  drill {
    name "Vehicle type"
    label :type
    path "type"
    interface :drop_down
    note "Select the type of heavy goods vehicle under consideration."
  }

  drill {
    name "Vehicle size"
    label :size
    path "size"
    interface :drop_down
    note "Select the size class of heavy goods vehicle under consideration."
  }

  drill {
    name "Percent laden"
    label :load
    path "load"
    interface :drop_down
    note "Select the (typical) loading level of the vehicle type under consideration."
  }

  profile {
    name "Distance travelled"
    label :distance
    path "distance"
    default_unit :km
    alternative_units :m, :ft, :in, :mi, :nmi, :yd
    unit :km
    type :decimal
    interface :text_box
    note "Specify the total distance travelled. This can represent one or multiple journeys."
  }

  profile {
    name "Vehicle occupancy"
    label :occupancy
    path "occupancy"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Vehicle occupancy"
    hide!
  }

  output {
    name "CO2"
    label :co2
    path "CO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2 emissions calculated based on data entered for each scenario"
  }

  output {
    name "CO2e"
    label :co2e
    path "CO2e"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"
  }

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology enables the calculation of CO2 emissions associated with UK road vehicles"
    interface :drop_down
    hide!
  }

  metadatum {
    name "Source description"
    label :source_description
    path "source_description"
    type :string
    interface :text_box
    note "Provide a description for the transport emissions source under consideration"
  }

}

calculation {

  name "US road vehicles by fuel"
  label :us_road_vehicles_by_fuel
  path "/transport/ghgp/vehicle/us"

  drill {
    name "Vehicle type"
    label :type
    path "type"
    interface :drop_down
    note "Select the type of vehicle(s) under consideration."
  }

  drill {
    name "Fuel type"
    label :fuel
    path "fuel"
    interface :drop_down
    note "Select the type of fuel used by the vehicle(s)."
  }

  drill {
    name "Vehicle emission standard"
    label :emission_standard
    path "emissionStandard"
    interface :drop_down
    note "Select the emissions abatement technology standard of the vehicle(s) under consideration."
  }

  profile {
    name "Fuel consumed"
    label :volume
    path "volume"
    default_unit :gal
    alternative_units :m³, :L, :bbl, :bbl_fl_us, :gallon_dry_us, :gal_uk, :oz_fl, :oz_fl_uk
    unit :gal
    type :decimal
    interface :text_box
    note "Specify the quantity of fuel consumed."
  }

  profile {
    name "Vehicle occupancy"
    label :occupancy
    path "occupancy"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the (typical) vehicle occupancy. This is used to convert total vehiclular emissions into per passenger emissions. If only total vehicular emissions are required, this value can be ignored."
  }

  output {
    name "Bio co2"
    label :bio_co2
    path "bioCO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    hide!
  }

  output {
    name "CH4"
    label :ch4
    path "CH4"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CH4 emissions calculated based on data entered for each scenario."
  }

  output {
    name "CO2"
    label :co2
    path "CO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2 emissions calculated based on data entered for each scenario"
  }

  output {
    name "CO2e"
    label :co2e
    path "CO2e"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"
  }

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  output {
    name "N2O"
    label :n2_o
    path "N2O"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "N2O emissions calculated based on data entered for each scenario."
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology enables the calculation of CO2, CH4, N2O and CO2e emissions associated with US road vehicles and on the basis of fuel consumption"
    interface :drop_down
    hide!
  }

  metadatum {
    name "Source description"
    label :source_description
    path "source_description"
    type :string
    interface :text_box
    note "Provide a description for the transport emissions source under consideration"
  }

}

calculation {

  name "US road vehicles by distance"
  label :us_road_vehicles_by_distance
  path "/transport/ghgp/vehicle/us"

  drill {
    name "Vehicle type"
    label :type
    path "type"
    interface :drop_down
    note "Select the type of vehicle(s) under consideration."
  }

  drill {
    name "Fuel type"
    label :fuel
    path "fuel"
    interface :drop_down
    note "Select the type of fuel used by the vehicle(s)."
  }

  drill {
    name "Vehicle emission standard"
    label :emission_standard
    path "emissionStandard"
    interface :drop_down
    note "Select the emissions abatement technology standard of the vehicle(s) under consideration."
  }

  profile {
    name "Distance travelled"
    label :distance
    path "distance"
    default_unit :mi
    alternative_units :m, :km, :ft, :in, :nmi, :yd
    unit :mi
    type :decimal
    interface :text_box
    note "Specify the total distance travelled. This can represent one or multiple journeys."
  }

  profile {
    name "Vehicle occupancy"
    label :occupancy
    path "occupancy"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the (typical) vehicle occupancy. This is used to convert total vehiclular emissions into per passenger emissions. If only total vehicular emissions are required, this value can be ignored."
  }

  output {
    name "Bio co2"
    label :bio_co2
    path "bioCO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    hide!
  }

  output {
    name "CH4"
    label :ch4
    path "CH4"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CH4 emissions calculated based on data entered for each scenario."
  }

  output {
    name "CO2"
    label :co2
    path "CO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2 emissions calculated based on data entered for each scenario"
  }

  output {
    name "CO2e"
    label :co2e
    path "CO2e"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"
  }

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  output {
    name "N2O"
    label :n2_o
    path "N2O"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "N2O emissions calculated based on data entered for each scenario."
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology enables the calculation of CO2, CH4, N2O and CO2e and biogenic CO2 emissions associated with US road vehicles and on the basis of distance travelled"
    interface :drop_down
    hide!
  }

  metadatum {
    name "Source description"
    label :source_description
    path "source_description"
    type :string
    interface :text_box
    note "Provide a description for the transport emissions source under consideration"
  }

}

calculation {

  name "Other regional road vehicles"
  label :other_road_vehicles
  path "/transport/ghgp/vehicle/other"

  drill {
    name "Vehicle type"
    label :type
    path "type"
    interface :drop_down
    note "Select the type of vehicle(s) under consideration."
  }

  drill {
    name "Fuel type"
    label :fuel
    path "fuel"
    interface :drop_down
    note "Select the type of fuel used by the vehicle(s)."
  }

  drill {
    name "Vehicle emission standard"
    label :emission_standard
    path "emissionStandard"
    interface :drop_down
    note "Select the emissions abatement technology standard of the vehicle(s) under consideration."
  }

  profile {
    name "Distance travelled"
    label :distance
    path "distance"
    default_unit :mi
    alternative_units :m, :km, :ft, :in, :nmi, :yd
    unit :mi
    type :decimal
    interface :text_box
    note "Specify the total distance travelled. This can represent one or multiple journeys."
  }

  profile {
    name "Vehicle occupancy"
    label :occupancy
    path "occupancy"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the (typical) vehicle occupancy. This is used to convert total vehiclular emissions into per passenger emissions. If only total vehicular emissions are required, this value can be ignored."
  }

  output {
    name "Bio co2"
    label :bio_co2
    path "bioCO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    hide!
  }

  output {
    name "CO2"
    label :co2
    path "CO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2 emissions calculated based on data entered for each scenario"
  }

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology enables the calculation of CO2 and biogenic CO2 emissions associated with road vehicles in non-UK/UK regions."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Source description"
    label :source_description
    path "source_description"
    type :string
    interface :text_box
    note "Provide a description for the transport emissions source under consideration"
  }

}

calculation {

  name "Passenger transport"
  label :transport_passenger
  path "/transport/ghgp/passenger"

  drill {
    name "Vehicle type"
    label :type
    path "type"
    interface :drop_down
    note "Select the general mode of passenger transport under consideration."
  }

  drill {
    name "Vehicle subtype"
    label :subtype
    path "subtype"
    interface :drop_down
    note "Select the subtype of passenger transport under consideration."
  }

  drill {
    name "Passenger class"
    label :class
    path "class"
    interface :drop_down
    note "Select the passenger class under consideration."
  }

  drill {
    name "Region"
    label :region
    path "region"
    interface :drop_down
    note "Select the specific regional context in which travel occurred."
  }

  profile {
    name "Distance travelled"
    label :distance
    path "distance"
    default_unit :mi
    alternative_units :m, :km, :ft, :in, :nmi, :yd
    unit :mi
    type :decimal
    interface :text_box
    note "Specify the total distance travelled. This can represent one or multiple journeys."
  }

  profile {
    name "Number of passengers"
    label :passengers
    path "passengers"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the number of passengers under consideration."
  }

  output {
    name "CH4"
    label :ch4
    path "CH4"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CH4 emissions calculated based on data entered for each scenario."
  }

  output {
    name "CO2"
    label :co2
    path "CO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2 emissions calculated based on data entered for each scenario"
  }

  output {
    name "CO2e"
    label :co2e
    path "CO2e"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"
  }

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  output {
    name "N2O"
    label :n2_o
    path "N2O"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "N2O emissions calculated based on data entered for each scenario."
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology enables the calculation of CO2, CH4, N2O and CO2e emissions associated with passenger transport."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Source description"
    label :source_description
    path "source_description"
    type :string
    interface :text_box
    note "Provide a description for the transport emissions source under consideration"
  }

}

calculation {

  name "Freight transport"
  label :transport_freight
  path "/transport/ghgp/freight"

  drill {
    name "Freighting type"
    label :type
    path "type"
    interface :drop_down
    note "Select the general mode of freight transport under consideration."
  }

  drill {
    name "Freighting subtype"
    label :subtype
    path "subtype"
    interface :drop_down
    note "Select the subtype of freight transport under consideration."
  }

  drill {
    name "Vehicle size"
    label :size
    path "size"
    interface :drop_down
    note "Select the size class of freight transport under consideration."
  }

  drill {
    name "Region"
    label :region
    path "region"
    interface :drop_down
    note "Select the specific regional context in which freighting occurred."
  }

  profile {
    name "Distance freighted"
    label :distance
    path "distance"
    default_unit :mi
    alternative_units :m, :km, :ft, :in, :nmi, :yd
    unit :mi
    type :decimal
    interface :text_box
    note "Specify the total distance travelled. This can represent one or multiple journeys."
  }

  profile {
    name "Quantity freighted"
    label :mass
    path "mass"
    default_unit :ton_us
    alternative_units :kg, :g, :oz, :lb, :t, :Mg, :Gg, :ton_uk
    unit :ton_us
    type :decimal
    interface :text_box
    note "Specify the quantity of goods freighted."
  }

  output {
    name "CH4"
    label :ch4
    path "CH4"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CH4 emissions calculated based on data entered for each scenario."
  }

  output {
    name "CO2"
    label :co2
    path "CO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2 emissions calculated based on data entered for each scenario"
  }

  output {
    name "CO2e"
    label :co2e
    path "CO2e"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"
  }

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  output {
    name "N2O"
    label :n2_o
    path "N2O"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "N2O emissions calculated based on data entered for each scenario."
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology enables the calculation of CO2, CH4, N2O and CO2e emissions associated with freight transport."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Source description"
    label :source_description
    path "source_description"
    type :string
    interface :text_box
    note "Provide a description for the transport emissions source under consideration"
  }

}


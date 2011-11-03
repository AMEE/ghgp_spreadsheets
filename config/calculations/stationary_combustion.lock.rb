calculation {

  name "Stationary fuel combustion by energy"
  label :stationary_combustion_by_energy
  path "/business/energy/stationaryCombustion"

  drill {
    name "Type of fuel"
    label :fuel
    path "fuel"
    interface :drop_down
    note "Select the type of fuel consumed during the reporting period"
  }

  drill {
    name "Combustion context"
    label :context
    path "context"
    interface :drop_down
    note "Select the specific sectoral context in which fuel combustion was employed during the reporting period"
  }

  profile {
    name "Energy of fuel used"
    label :nrg
    path "NRG"
    default_unit :TJ
    alternative_units :J, :kWh, :MJ, :GJ, :BTU_FiftyNineF, :MBTU_FiftyNineF, :MWh
    unit :TJ
    type :decimal
    interface :text_box
    note "Specify the quantity of fuel consumed during the reporting period in terms of a quantity of energy"
  }

  profile {
    name "Use higher heating value?"
    label :use_hhv
    path "useHHV"
    value "false"
    choices ["true","false"]
    optional!
    type :text
    interface :drop_down
    note "Specify whether the quantity of energy used represents a measure according to the higher or lower heating (calorific) value"
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
    value "This methodology enables the calculation of CO2, CH4 and N2O associated with the stationary combustion of fuels on the basis of quantities of energy yielded."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}

calculation {

  name "Stationary fuel combustion by mass"
  label :stationary_combustion_by_mass
  path "/business/energy/stationaryCombustion"

  drill {
    name "Type of fuel"
    label :fuel
    path "fuel"
    choices "Anthracite","Aviation gasoline","Biodiesels","Biogasoline","Bitumen","Blast furnace gas","Brown coal briquettes","Butane","Coal tar","Coke oven coke","Coke oven gas","Coking coal","Crude oil","Distillate fuel oil No.1","Distillate fuel oil No.2","Ethane","Gas coke","Gas works gas","Gas/Diesel oil","Jet gasoline","Jet kerosene","Landfill gas","Lignite","Lignite coke","Liquified Petroleum Gases","Lubricants","Motor gasoline","Municipal waste (Non biomass fraction)","Municipal wastes (Biomass fraction)","Naphtha","Natural gas","Natural Gas Liquids","Oil shale and tar sands","Orimulsion","Other biogas","Other bituminous coal","Other kerosene","Other liquid biofuels","Other petroleum products","Other primary solid biomass fuels","Oxygen steel furnace gas","Paraffin waxes","Patent fuel","Peat","Petroleum coke","Propane","Refinery feedstocks","Refinery gas","Residual fuel oil","Residual fuel oil No.4","Residual fuel oil No.5","Residual fuel oil No.6","Shale oil","Sludge gas","Sub bituminous coal","Sulphite lyes (Black liqour)","Waste oils","White Spirit/SBP","Wood or Wood waste"
    interface :drop_down
    note "Select the type of fuel consumed during the reporting period"
  }

  drill {
    name "Combustion context"
    label :context
    path "context"
    interface :drop_down
    note "Select the specific sectoral context in which fuel combustion was employed during the reporting period"
  }

  profile {
    name "Mass of fuel used"
    label :mass
    path "mass"
    default_unit :Gg
    alternative_units :kg, :g, :oz, :lb, :t, :Mg, :ton_us, :ton_uk
    unit :Gg
    type :decimal
    interface :text_box
    note "Specify the quantity of fuel consumed during the reporting period in terms of a mass-based quantity"
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
    value "This methodology enables the calculation of CO2, CH4 and N2O associated with the stationary combustion of fuels on the basis of masses consumed."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}

calculation {

  name "Stationary fuel combustion by volume"
  label :stationary_combustion_by_volume
  path "/business/energy/stationaryCombustion"

  drill {
    name "Type of fuel"
    label :fuel
    path "fuel"
    choices "Aviation gasoline","Butane","Crude oil","Distillate fuel oil No.1","Distillate fuel oil No.2","Ethane","Jet kerosene","Landfill gas","Liquified Petroleum Gases","Lubricants","Motor gasoline","Naphtha","Natural gas","Other kerosene","Propane","Residual fuel oil No.4","Residual fuel oil No.5","Residual fuel oil No.6"
    interface :drop_down
    note "Select the type of fuel consumed during the reporting period"
  }

  drill {
    name "Combustion context"
    label :context
    path "context"
    interface :drop_down
    note "Select the specific sectoral context in which fuel combustion was employed during the reporting period"
  }

  profile {
    name "Volume of fuel used"
    label :volume
    path "volume"
    default_unit :m³
    alternative_units :L, :bbl, :bbl_fl_us, :gal, :gallon_dry_us, :gal_uk, :oz_fl, :oz_fl_uk
    unit :m³
    type :decimal
    interface :text_box
    note "Specify the quantity of fuel consumed during the reporting period in terms of a volume-based quantity"
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
    value "This methodology enables the calculation of CO2, CH4 and N2O associated with the stationary combustion of fuels on the basis of volumes consumed."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}


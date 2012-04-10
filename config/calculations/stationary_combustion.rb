# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

all_calculations {
  metadatum {
    name 'Reporting period'
    label :reporting_period
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
    type 'string'
  }

  # Correct titles for outputs
  correcting(:co2)   { name "CO2" }
  correcting(:ch4)   { name "CH4" }
  correcting(:co2e)  { name "CO2e" }
  correcting(:n2_o)  { name "N2O"}
}

calculation {
  name "Stationary fuel combustion by energy"
  label :stationary_combustion_by_energy
  path "/business/energy/stationaryCombustion"
  terms_from_amee 'byEnergy'
  correcting (:comment) { hide! }

  correcting(:fuel)    {note "Select the type of fuel consumed during the reporting period"}
  correcting(:context) {note "Select the specific sectoral context in which fuel combustion was employed during the reporting period"}
  correcting(:nrg)     {note "Specify the quantity of fuel consumed during the reporting period in terms of a quantity of energy"}
  correcting(:co2)     {note "CO2 emissions calculated based on data entered for each scenario"}
  correcting(:co2e)    {note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"}
  correcting(:ch4)     {note "CH4 emissions calculated based on data entered for each scenario."}
  correcting(:n2_o)    {note "N2O emissions calculated based on data entered for each scenario."}
  correcting(:use_hhv) {note "Specify whether the quantity of energy used represents a measure according to the higher or lower heating (calorific) value"}

  metadatum {
    label :note
    value "This methodology enables the calculation of CO2, CH4 and N2O associated with the stationary combustion of fuels on the basis of quantities of energy yielded."
    hide!
  }
}

calculation {
  name "Stationary fuel combustion by mass"
  label :stationary_combustion_by_mass
  path "/business/energy/stationaryCombustion"
  terms_from_amee 'byMass'
  correcting (:comment) { hide! }
  correcting (:fuel) {
    choices "Anthracite", "Aviation gasoline", "Biodiesels", "Biogasoline", "Bitumen", "Blast furnace gas", "Brown coal briquettes", "Butane", "Coal tar", "Coke oven coke", "Coke oven gas", "Coking coal", "Crude oil", "Distillate fuel oil No.1", "Distillate fuel oil No.2", "Ethane", "Gas coke", "Gas works gas", "Gas/Diesel oil", "Jet gasoline", "Jet kerosene", "Landfill gas", "Lignite", "Lignite coke", "Liquified Petroleum Gases", "Lubricants", "Motor gasoline", "Municipal waste (Non biomass fraction)", "Municipal wastes (Biomass fraction)", "Naphtha", "Natural gas", "Natural Gas Liquids", "Oil shale and tar sands", "Orimulsion", "Other biogas", "Other bituminous coal", "Other kerosene", "Other liquid biofuels", "Other petroleum products", "Other primary solid biomass fuels", "Oxygen steel furnace gas", "Paraffin waxes", "Patent fuel", "Peat", "Petroleum coke", "Propane", "Refinery feedstocks", "Refinery gas", "Residual fuel oil", "Residual fuel oil No.4", "Residual fuel oil No.5", "Residual fuel oil No.6", "Shale oil", "Sludge gas", "Sub bituminous coal", "Sulphite lyes (Black liqour)", "Waste oils", "White Spirit/SBP", "Wood or Wood waste"
  }

  correcting(:fuel)    {note "Select the type of fuel consumed during the reporting period"}
  correcting(:context) {note "Select the specific sectoral context in which fuel combustion was employed during the reporting period"}
  correcting(:mass)    {note "Specify the quantity of fuel consumed during the reporting period in terms of a mass-based quantity"}
  correcting(:co2)     {note "CO2 emissions calculated based on data entered for each scenario"}
  correcting(:co2e)    {note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"}
  correcting(:ch4)     {note "CH4 emissions calculated based on data entered for each scenario."}
  correcting(:n2_o)    {note "N2O emissions calculated based on data entered for each scenario."}

  metadatum {
    label :note
    value "This methodology enables the calculation of CO2, CH4 and N2O associated with the stationary combustion of fuels on the basis of masses consumed."
    hide!
  }
}

calculation {
  name "Stationary fuel combustion by volume"
  label :stationary_combustion_by_volume
  path "/business/energy/stationaryCombustion"
  terms_from_amee 'byVolume'
  correcting (:comment) { hide! }
  correcting (:fuel) {
    # some fuels have densities but not on every item: Shale Oil, Gas/Diesel oil, Residual fuel oil
    choices "Aviation gasoline", "Butane", "Crude oil", "Distillate fuel oil No.1", "Distillate fuel oil No.2", "Ethane", "Jet kerosene", "Landfill gas", "Liquified Petroleum Gases", "Lubricants", "Motor gasoline", "Naphtha", "Natural gas", "Other kerosene", "Propane", "Residual fuel oil No.4", "Residual fuel oil No.5", "Residual fuel oil No.6"
  }

  correcting(:fuel)    {note "Select the type of fuel consumed during the reporting period"}
  correcting(:context) {note "Select the specific sectoral context in which fuel combustion was employed during the reporting period"}
  correcting(:volume)  {note "Specify the quantity of fuel consumed during the reporting period in terms of a volume-based quantity"}
  correcting(:co2)     {note "CO2 emissions calculated based on data entered for each scenario"}
  correcting(:co2e)    {note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"}
  correcting(:ch4)     {note "CH4 emissions calculated based on data entered for each scenario."}
  correcting(:n2_o)    {note "N2O emissions calculated based on data entered for each scenario."}

  metadatum {
    label :note
    value "This methodology enables the calculation of CO2, CH4 and N2O associated with the stationary combustion of fuels on the basis of volumes consumed."
    hide!
  }
}
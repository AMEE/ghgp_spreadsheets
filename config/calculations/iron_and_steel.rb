Calculations=
  AMEE::DataAbstraction::CalculationSet.new {

  all_calculations {
    metadatum {
      name 'Reporting period'
      label :reporting_period
      interface :text_box
      note "Provide a reference for the reporting period under consideration"
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
  
  calculation {
    name 'Coke production'
    label :coke_production
    path '/business/processes/production/ironandsteel/coke'
    terms_from_amee 'default'
    correcting (:comment) { hide! }
    correcting(:material) {name 'Fuel'}

    correcting(:material)           {note "Select the type of fuel consumed during the reporting period"}
    correcting(:blast_gas_quantity) {note "Specify the quantity of blast furnace gas consumed during the reporting period"}
    correcting(:byprod_quantity)    {note "Specify the quantity of coke oven by-products produced or transferred offsite during the reporting period"}
    correcting(:coke_gas_quantity)  {note "Specify the quantity of coke oven gas produced or transferred offsite during the reporting period"}
    correcting(:coke_quantity)      {note "Specify the quantity of coke produced during the reporting period"}
    correcting(:material_quantity)  {note "Specify the quantity of fuel consumed during the reporting period"}
    correcting(:blast_gas_carbon)   {note "Specify the carbon content (% by mass) of blast furnace gas consumed during the reporting period"}
    correcting(:byprod_carbon)      {note "Specify the carbon content (% by mass) of coke oven by-products produced during the reporting period"}
    correcting(:carbon_content)     {name "Fuel carbon content"; note "Specify the carbon content (% by mass) of fuel consumed during the reporting period"}
    correcting(:ch4_em)             {note "Specify the quantity of CH4 emitted per unit of coke produced during the reporting period"}
    correcting(:coke_carbon)        {note "Specify the carbon content (% by mass) of coke produced during the reporting period"}
    correcting(:coke_gas_carbon)    {note "Specify the carbon content (% by mass) of coke gas produced during the reporting period"}
    correcting(:co2)                {note "CO2 emissions calculated based on data entered for each scenario"}
    correcting(:co2e)               {note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"}

    metadatum {
      label :note
      value "This methodology enables the calculation of CO2, CH4 and CO2e emissions associated with on-site coke production"
      hide!
    }
  }

  calculation {
    name 'Sinter production'
    label :sinter
    path '/business/processes/production/ironandsteel/sinter'
    terms_from_amee 'default'
    correcting (:comment) { hide! }

    correcting(:material)                {note "Select the type of fuel consumed during the reporting period"}
    correcting(:material_quantity)       {note "Specify the quantity of fuel consumed during the reporting period"}
    correcting(:sinter_quantity)         {note "Specify the quantity of sinter produced during the reporting period"}
    correcting(:offsite_sinter_quantity) {name "Amount of sinter off gas transferred offsite"; note "Specify the quantity of sinter off gas transferred offsite during the reporting period"}
    correcting(:carbon_content)          {name "Fuel carbon content"; note "Specify the carbon content (% by mass) of fuel consumed during the reporting period"}
    correcting(:carbon_sinter)           {name "Carbon content of sinter off gas"; note "Specify the carbon content (% by mass) of sinter off gas transferred offsite during the reporting period"}
    correcting(:ch4_em)                  {note "Specify the quantity of CH4 emitted per unit of sinter produced during the reporting period"}
    correcting(:co2)                     {note "CO2 emissions calculated based on data entered for each scenario"}
    correcting(:ch4)                     {note "CH4 emissions calculated based on data entered for each scenario."}
    correcting(:co2e)                    {note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"}

    metadatum {
      label :note
      value "This methodology enables the calculation of CO2, CH4 and CO2e emissions associated with sinter production"
      hide!
    }
  }

  calculation {
    name 'Direct reduced iron production'
    label :dri
    path '/business/processes/production/ironandsteel/dri'
    terms_from_amee 'default'
    correcting (:comment) { hide! }
    correcting (:type) { hide! }

    correcting(:dri_quantity)      {note "Select the quantity of direct reduced iron produced during the reporting period"}
    correcting(:ch4_em)            {note "Specify the quantity of CH4 emitted per unit of sinter produced during the reporting period"}
    correcting(:coke_carbon)       {note "Specify the carbon content (% by mass) of coke breeze consumed during the reporting period"}
    correcting(:coke_quantity)     {note "Specify the quantity of coke breeze consumed during the reporting period"}
    correcting(:met_coke_carbon)   {note "Specify the quantity of metallurgical coke consumed during the reporting period"}
    correcting(:met_coke_quantity) {note "Specify the carbon content (% by mass) of metallurgical coke consumed during the reporting period"}
    correcting(:gas_carbon)        {note "Specify the carbon content (% by mass) of natural gas consumed during the reporting period"}
    correcting(:gas_quantity)      {note "Specify the quantity of natural gas consumed during the reporting period"}
    correcting(:co2)               {note "CO2 emissions calculated based on data entered for each scenario"}
    correcting(:ch4)               {note "CH4 emissions calculated based on data entered for each scenario."}
    correcting(:co2e)              {note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"}

    metadatum {
      label :note
      value "This methodology enables the calculation of CO2, CH4 and CO2e emissions associated with Direct Reduced Iron production"
      hide!
    }
  }

  calculation {
    name 'Iron and Steel production'
    label :iron_and_steel
    path '/business/processes/production/ironandsteel/ironAndSteel'
    terms_from_amee 'default'
    correcting (:comment) { hide! }

    correcting(:material)          {note "Select the type of carbon feedstock consumed during the reporting period"}
    correcting(:material_quantity) {note "Specify the quantity of carbon feedstock consumed during the reporting period"}
    correcting(:carbon_content)    {note "Specify the carbon content (% by mass) of the carbon feedstock consumed during the reporting period"}
    correcting(:iron_carbon)       {note "Specify the carbon content (% by mass) of iron not converted into steel during the reporting period"}
    correcting(:iron_quantity)     {note "Specify the quantity of iron not converted into steel during the reporting period"}
    correcting(:pig_quantity)      {note "Specify the quantity of pig iron produced during the reporting period"}
    correcting(:steel_carbon)      {note "Specify the carbon content (% by mass) of steel produced during the reporting period"}
    correcting(:steel_quantity)    {note "Specify the quantity of steel produced during the reporting period"}
    correcting(:gas_carbon)        {note "Specify the carbon content (% by mass) of blast furnace gas transferred offsite during the reporting period"}
    correcting(:gas_quantity)      {note "Specify the quantity of blast furnace gas transferred offsite during the reporting period"}
    correcting(:ch4_em)            {note "Specify the quantity of CH4 emitted per unit of sinter produced during the reporting period"}
    correcting(:co2)               {note "CO2 emissions calculated based on data entered for each scenario"}
    correcting(:ch4)               {note "CH4 emissions calculated based on data entered for each scenario."}
    correcting(:co2e)              {note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"}

    metadatum {
      label :note
      value "This methodology enables the calculation of CO2, CH4 and CO2e emissions associated with Iron and Steel production"
      hide!
    }
  }

=begin
  # NOT ON LIVE SERVER YET
  calculation {
    name 'Flaring'
    label :flaring
    path '/business/processes/flaring/ghgp'
    terms_from_amee 'default'
    correcting (:type) { hide! }
    correcting (:comment) { hide! }

    metadatum {
      label :note
      value "This methodology enables the calculation of CO2, CH4 and CO2e emissions associated with the flaring of waste gases"
      hide!
    }
  }
=end

  calculation {
    name 'Onsite lime production'
    label :onsite_lime
    path '/business/processes/production/lime/carbonate'
    terms_from_amee 'default'
    correcting (:comment) { hide! }

    correcting(:carbonate_type)     {note "Select the type of carbonate feedstock consumed during the reporting period"}
    correcting(:ef)                 {note "Specify the quantity of CO2 produced per unit of carbonate consumed during the reporting period"}
    correcting(:calcination_frac)   {note "Specify the fraction (decimal fraction; 0-1) calcination acheived for the carbon feedstock consumed during the reporting period"}
    correcting(:lkd_calc_frac)      {note "Specify the fraction (decimal fraction; 0-1) calcination acheived for lime kiln dust during the reporting period"}
    correcting(:carbonate_quantity) {note "Specify the quantity of carbonate feedstock consumed during the reporting period"}
    correcting(:lkd_quantity)       {note "Specify the quantity of lime kiln dust produced during the reporting period"}
    correcting(:weight_lkd)         {note "Specify the quantity (decimal fraction by weight; 0-1) of original carbonate in lime kiln dust during the reporting period"}
    correcting(:co2)                {note "CO2 emissions calculated based on data entered for each scenario"}

    metadatum {
      label :note
      value "This methodology enables the calculation of CO2 emissions associated with onsite lime production"
      hide!
    }
  }

  calculation {
    name 'Offsite lime production'
    label :offsite_lime
    path '/business/processes/production/lime/production'
    terms_from_amee 'default'
    correcting(:comment) { hide! }

    metadatum {
      label :note
      value "This methodology can be used to calculate the CO2 emissions associated with the offsite production of lime."
      hide!
    }
    correcting(:lime_type) { note "Select the type of lime produced during the reporting period" }
    correcting(:lime_quantity) { note "Specify the quantity of lime produced during the reporting period" }
    correcting(:calcination_lkd) { note "Specify the fraction of calcination achieved for the carbonates in lime kiln dust, as a decimal fraction (0-1). If not specified, an industry typical value is used." }
    correcting(:cao_mgo_ratio) { note "Specify the CaO or CaO·MgO content of the lime, as a decimal fraction (0-1). If not specified, an industry typical value is used" }
    correcting(:frac_lkd) { note "Specify the original carbonate content of lime kiln dust, as a decimal fraction (0-1). If not specified, an industry typical value is used" }
    correcting(:hyd_lime) { note "Specify the proportion of the produced lime which is hydrated, as a decimal fraction (0-1). If not specified, an industry typical value is used" }
    correcting(:stoic_ratio) { note "Specify the stoichiometric ratio (as a decimal fraction; 0-1) between the calcination products CaO or CaO·MgO and CO2. If not specified, an industry typical value is used" }
    correcting(:water_lime) { note "Specify the water content of hydrated lime, as a decimal fraction (0-1). If not specified, an industry typical value is used" }
    correcting(:lkd_weight) { note "Specify the quantity of lime kiln dust not return to the lime kiln. If not specified, an industry typical value is used" }
    correcting(:co2) { note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario" }
  }
}


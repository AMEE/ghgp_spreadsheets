Calculations = AMEE::DataAbstraction::CalculationSet.new {

  calculation {

    name 'Stationary fuel combustion by energy'
    label :stationary_combustion_by_energy
    path '/business/energy/stationaryCombustion'

    drill {
      name 'Type of fuel'
      label :fuel
      path 'fuel'
      interface :drop_down
      note 'Select the type of fuel consumed during the reporting period'
    }

    drill {
      name 'Combustion context'
      label :context
      path 'context'
      interface :drop_down
      note 'Select the specific sectoral context in which fuel combustion was employed during the reporting period'
      disable!
    }

    profile {
      name 'Energy of fuel used'
      label :nrg
      path 'NRG'
      default_unit :TJ
      alternative_units :J, :kWh, :MJ, :GJ, :BTU_FiftyNineF, :MBTU_FiftyNineF, :MWh
      unit :TJ
      type :decimal
      interface :text_box
      note 'Specify the quantity of fuel consumed during the reporting period in terms of a quantity of energy'
    }

    profile {
      name 'Use higher heating value?'
      label :use_hhv
      path 'useHHV'
      value 'false'
      choices ['true','false']
      optional!
      type :text
      interface :drop_down
      note 'Specify whether the quantity of energy used represents a measure according to the higher or lower heating (calorific) value'
    }

    output {
      name 'CH4'
      label :ch4
      path 'CH4'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CH4 emissions calculated based on data entered for each scenario.'
    }

    output {
      name 'CO2'
      label :co2
      path 'CO2'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2 emissions calculated based on data entered for each scenario'
    }

    output {
      name 'CO2e'
      label :co2e
      path 'CO2e'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2'
    }

    output {
      name 'Comment'
      label :comment
      path 'comment'
      hide!
    }

    output {
      name 'N2O'
      label :n2_o
      path 'N2O'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'N2O emissions calculated based on data entered for each scenario.'
    }

    metadatum {
      name 'Note'
      label :note
      path 'note'
      value 'This methodology enables the calculation of CO2, CH4 and N2O associated with the stationary combustion of fuels on the basis of quantities of energy yielded.'
      interface :drop_down
      hide!
    }

    metadatum {
      name 'Reporting period'
      label :reporting_period
      path 'reporting_period'
      interface :text_box
      note 'Provide a reference for the reporting period under consideration'
    }

  }

  calculation {

    name 'Stationary fuel combustion by mass'
    label :stationary_combustion_by_mass
    path '/business/energy/stationaryCombustion'

    drill {
      name 'Type of fuel'
      label :fuel
      path 'fuel'
      choices 'Anthracite','Aviation gasoline','Biodiesels','Biogasoline','Bitumen','Blast furnace gas','Brown coal briquettes','Butane','Coal tar','Coke oven coke','Coke oven gas','Coking coal','Crude oil','Distillate fuel oil No.1','Distillate fuel oil No.2','Ethane','Gas coke','Gas works gas','Gas/Diesel oil','Jet gasoline','Jet kerosene','Landfill gas','Lignite','Lignite coke','Liquified Petroleum Gases','Lubricants','Motor gasoline','Municipal waste (Non biomass fraction)','Municipal wastes (Biomass fraction)','Naphtha','Natural gas','Natural Gas Liquids','Oil shale and tar sands','Orimulsion','Other biogas','Other bituminous coal','Other kerosene','Other liquid biofuels','Other petroleum products','Other primary solid biomass fuels','Oxygen steel furnace gas','Paraffin waxes','Patent fuel','Peat','Petroleum coke','Propane','Refinery feedstocks','Refinery gas','Residual fuel oil','Residual fuel oil No.4','Residual fuel oil No.5','Residual fuel oil No.6','Shale oil','Sludge gas','Sub bituminous coal','Sulphite lyes (Black liqour)','Waste oils','White Spirit/SBP','Wood or Wood waste'
      interface :drop_down
      note 'Select the type of fuel consumed during the reporting period'
    }

    drill {
      name 'Combustion context'
      label :context
      path 'context'
      interface :drop_down
      note 'Select the specific sectoral context in which fuel combustion was employed during the reporting period'
      disable!
    }

    profile {
      name 'Mass of fuel used'
      label :mass
      path 'mass'
      default_unit :Gg
      alternative_units :kg, :g, :oz, :lb, :t, :Mg, :ton_us, :ton_uk
      unit :Gg
      type :decimal
      interface :text_box
      note 'Specify the quantity of fuel consumed during the reporting period in terms of a mass-based quantity'
    }

    output {
      name 'CH4'
      label :ch4
      path 'CH4'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CH4 emissions calculated based on data entered for each scenario.'
    }

    output {
      name 'CO2'
      label :co2
      path 'CO2'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2 emissions calculated based on data entered for each scenario'
    }

    output {
      name 'CO2e'
      label :co2e
      path 'CO2e'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2'
    }

    output {
      name 'Comment'
      label :comment
      path 'comment'
      hide!
    }

    output {
      name 'N2O'
      label :n2_o
      path 'N2O'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'N2O emissions calculated based on data entered for each scenario.'
    }

    metadatum {
      name 'Note'
      label :note
      path 'note'
      value 'This methodology enables the calculation of CO2, CH4 and N2O associated with the stationary combustion of fuels on the basis of masses consumed.'
      interface :drop_down
      hide!
    }

    metadatum {
      name 'Reporting period'
      label :reporting_period
      path 'reporting_period'
      interface :text_box
      note 'Provide a reference for the reporting period under consideration'
    }

  }

  calculation {

    name 'Stationary fuel combustion by volume'
    label :stationary_combustion_by_volume
    path '/business/energy/stationaryCombustion'

    drill {
      name 'Type of fuel'
      label :fuel
      path 'fuel'
      choices 'Aviation gasoline','Butane','Crude oil','Distillate fuel oil No.1','Distillate fuel oil No.2','Ethane','Jet kerosene','Landfill gas','Liquified Petroleum Gases','Lubricants','Motor gasoline','Naphtha','Natural gas','Other kerosene','Propane','Residual fuel oil No.4','Residual fuel oil No.5','Residual fuel oil No.6'
      interface :drop_down
      note 'Select the type of fuel consumed during the reporting period'
    }

    drill {
      name 'Combustion context'
      label :context
      path 'context'
      interface :drop_down
      note 'Select the specific sectoral context in which fuel combustion was employed during the reporting period'
      disable!
    }

    profile {
      name 'Volume of fuel used'
      label :volume
      path 'volume'
      default_unit :m³
      alternative_units :L, :bbl, :oz_fl_uk, :gal_uk, :gallon_dry_us, :oz_fl, :bbl_fl_us, :gal
      unit :m³
      type :decimal
      interface :text_box
      note 'Specify the quantity of fuel consumed during the reporting period in terms of a volume-based quantity'
    }

    output {
      name 'CH4'
      label :ch4
      path 'CH4'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CH4 emissions calculated based on data entered for each scenario.'
    }

    output {
      name 'CO2'
      label :co2
      path 'CO2'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2 emissions calculated based on data entered for each scenario'
    }

    output {
      name 'CO2e'
      label :co2e
      path 'CO2e'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2'
    }

    output {
      name 'Comment'
      label :comment
      path 'comment'
      hide!
    }

    output {
      name 'N2O'
      label :n2_o
      path 'N2O'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'N2O emissions calculated based on data entered for each scenario.'
    }

    metadatum {
      name 'Note'
      label :note
      path 'note'
      value 'This methodology enables the calculation of CO2, CH4 and N2O associated with the stationary combustion of fuels on the basis of volumes consumed.'
      interface :drop_down
      hide!
    }

    metadatum {
      name 'Reporting period'
      label :reporting_period
      path 'reporting_period'
      interface :text_box
      note 'Provide a reference for the reporting period under consideration'
    }

  }

  calculation {

    name 'Coke production'
    label :coke_production
    path '/business/processes/production/ironandsteel/coke'

    drill {
      name 'Fuel'
      label :material
      path 'material'
      interface :drop_down
      note 'Select the type of fuel consumed during the reporting period'
    }

    profile {
      name 'Amount of Blast Furnace Gas Consumed'
      label :blast_gas_quantity
      path 'blastGasQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of blast furnace gas consumed during the reporting period'
    }

    profile {
      name 'Amount of Coke Oven By-Products Produced/Transferred Offsite'
      label :byprod_quantity
      path 'byprodQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of coke oven by-products produced or transferred offsite during the reporting period'
    }

    profile {
      name 'Amount of Coke Oven Gas Produced/Transferred Offsite'
      label :coke_gas_quantity
      path 'cokeGasQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of coke oven gas produced or transferred offsite during the reporting period'
    }

    profile {
      name 'Amount of Coke Produced Off/Onsite'
      label :coke_quantity
      path 'cokeQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of coke produced during the reporting period'
    }

    profile {
      name 'Amount of Material'
      label :material_quantity
      path 'materialQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of fuel consumed during the reporting period'
    }

    profile {
      name 'Blast Furnace Gas Carbon Content'
      label :blast_gas_carbon
      path 'blastGasCarbon'
      value '0.17'
      optional!
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the carbon content (% by mass) of blast furnace gas consumed during the reporting period'
    }

    profile {
      name 'By-Products Carbon Content'
      label :byprod_carbon
      path 'byprodCarbon'
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the carbon content (% by mass) of coke oven by-products produced during the reporting period'
    }

    profile {
      name 'Fuel carbon content'
      label :carbon_content
      path 'carbonContent'
      optional!
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the carbon content (% by mass) of fuel consumed during the reporting period'
    }

    profile {
      name 'CH4 Emission Factor'
      label :ch4_em
      path 'ch4EM'
      value '0.1'
      optional!
      default_unit :g
      default_per_unit :t
      alternative_units :kg, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :kg, :g, :oz, :lb, :Gg, :ton_us, :ton_uk
      unit :g
      per_unit :t
      type :decimal
      interface :text_box
      note 'Specify the quantity of CH4 emitted per unit of coke produced during the reporting period'
    }

    profile {
      name 'Coke Carbon Content'
      label :coke_carbon
      path 'cokeCarbon'
      value '0.83'
      optional!
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the carbon content (% by mass) of coke produced during the reporting period'
    }

    profile {
      name 'Coke Oven Gas Carbon Content'
      label :coke_gas_carbon
      path 'cokeGasCarbon'
      value '0.47'
      optional!
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the carbon content (% by mass) of coke gas produced during the reporting period'
    }

    output {
      name 'CH4'
      label :ch4
      path 'CH4'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
    }

    output {
      name 'CO2'
      label :co2
      path 'CO2'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2 emissions calculated based on data entered for each scenario'
    }

    output {
      name 'CO2e'
      label :co2e
      path 'CO2e'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2'
    }

    metadatum {
      name 'Note'
      label :note
      path 'note'
      value 'This methodology enables the calculation of CO2, CH4 and CO2e emissions associated with on-site coke production'
      interface :drop_down
      hide!
    }

    metadatum {
      name 'Reporting period'
      label :reporting_period
      path 'reporting_period'
      interface :text_box
      note 'Provide a reference for the reporting period under consideration'
    }

  }

  calculation {

    name 'Sinter production'
    label :sinter
    path '/business/processes/production/ironandsteel/sinter'

    drill {
      name 'Material'
      label :material
      path 'material'
      interface :drop_down
      note 'Select the type of fuel consumed during the reporting period'
    }

    profile {
      name 'Amount of Material'
      label :material_quantity
      path 'materialQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of fuel consumed during the reporting period'
    }

    profile {
      name 'Amount of sinter off gas transferred offsite'
      label :offsite_sinter_quantity
      path 'offsiteSinterQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of sinter off gas transferred offsite during the reporting period'
    }

    profile {
      name 'Amount of Sinter produced'
      label :sinter_quantity
      path 'sinterQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of sinter produced during the reporting period'
    }

    profile {
      name 'Fuel carbon content'
      label :carbon_content
      path 'carbonContent'
      optional!
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the carbon content (% by mass) of fuel consumed during the reporting period'
    }

    profile {
      name 'Carbon content of sinter off gas'
      label :carbon_sinter
      path 'carbonSinter'
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the carbon content (% by mass) of sinter off gas transferred offsite during the reporting period'
    }

    profile {
      name 'CH4 emission factor'
      label :ch4_em
      path 'ch4EM'
      value '0.00007'
      optional!
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of CH4 emitted per unit of sinter produced during the reporting period'
    }

    output {
      name 'CH4'
      label :ch4
      path 'CH4'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CH4 emissions calculated based on data entered for each scenario.'
    }

    output {
      name 'CO2'
      label :co2
      path 'CO2'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2 emissions calculated based on data entered for each scenario'
    }

    output {
      name 'CO2e'
      label :co2e
      path 'CO2e'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2'
    }

    metadatum {
      name 'Note'
      label :note
      path 'note'
      value 'This methodology enables the calculation of CO2, CH4 and CO2e emissions associated with sinter production'
      interface :drop_down
      hide!
    }

    metadatum {
      name 'Reporting period'
      label :reporting_period
      path 'reporting_period'
      interface :text_box
      note 'Provide a reference for the reporting period under consideration'
    }

  }

  calculation {

    name 'Direct reduced iron production'
    label :dri
    path '/business/processes/production/ironandsteel/dri'

    drill {
      name 'Type'
      label :type
      path 'type'
      interface :drop_down
      hide!
    }

    profile {
      name 'Amount of DRI Produced'
      label :dri_quantity
      path 'driQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Select the quantity of direct reduced iron produced during the reporting period'
    }

    profile {
      name 'CH4 Emission Factor'
      label :ch4_em
      path 'ch4EM'
      value '0.000048'
      optional!
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of CH4 emitted per unit of sinter produced during the reporting period'
    }

    profile {
      name 'Coke Breeze Carbon Content'
      label :coke_carbon
      path 'cokeCarbon'
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the carbon content (% by mass) of coke breeze consumed during the reporting period'
    }

    profile {
      name 'Coke Breeze Consumption'
      label :coke_quantity
      path 'cokeQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of coke breeze consumed during the reporting period'
    }

    profile {
      name 'Metallurgical Coke Carbon Content'
      label :met_coke_carbon
      path 'metCokeCarbon'
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of metallurgical coke consumed during the reporting period'
    }

    profile {
      name 'Metallurgical Coke Consumption'
      label :met_coke_quantity
      path 'metCokeQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the carbon content (% by mass) of metallurgical coke consumed during the reporting period'
    }

    profile {
      name 'Natural Gas Carbon Content'
      label :gas_carbon
      path 'gasCarbon'
      value '0.73'
      optional!
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the carbon content (% by mass) of natural gas consumed during the reporting period'
    }

    profile {
      name 'Natural Gas Consumption'
      label :gas_quantity
      path 'gasQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of natural gas consumed during the reporting period'
    }

    output {
      name 'CH4'
      label :ch4
      path 'CH4'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CH4 emissions calculated based on data entered for each scenario.'
    }

    output {
      name 'CO2'
      label :co2
      path 'CO2'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2 emissions calculated based on data entered for each scenario'
    }

    output {
      name 'CO2e'
      label :co2e
      path 'CO2e'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2'
    }

    metadatum {
      name 'Note'
      label :note
      path 'note'
      value 'This methodology enables the calculation of CO2, CH4 and CO2e emissions associated with Direct Reduced Iron production'
      interface :drop_down
      hide!
    }

    metadatum {
      name 'Reporting period'
      label :reporting_period
      path 'reporting_period'
      interface :text_box
      note 'Provide a reference for the reporting period under consideration'
    }

  }

  calculation {

    name 'Iron and Steel production'
    label :iron_and_steel
    path '/business/processes/production/ironandsteel/ironAndSteel'

    drill {
      name 'Material'
      label :material
      path 'material'
      interface :drop_down
      note 'Select the type of carbon feedstock consumed during the reporting period'
    }

    profile {
      name 'Amount of Iron not Converted into Steel'
      label :iron_quantity
      path 'ironQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of iron not converted into steel during the reporting period'
    }

    profile {
      name 'Amount of Material'
      label :material_quantity
      path 'materialQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of carbon feedstock consumed during the reporting period'
    }

    profile {
      name 'Amount of Pig Iron Produced'
      label :pig_quantity
      path 'pigQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of pig iron produced during the reporting period'
    }

    profile {
      name 'Amount of Steel Produced'
      label :steel_quantity
      path 'steelQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of steel produced during the reporting period'
    }

    profile {
      name 'Blast Furnace Gas Transferred Offsite'
      label :gas_quantity
      path 'gasQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of blast furnace gas transferred offsite during the reporting period'
    }

    profile {
      name 'Carbon Content (%w/w)'
      label :carbon_content
      path 'carbonContent'
      optional!
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the carbon content (% by mass) of the carbon feedstock consumed during the reporting period'
    }

    profile {
      name 'Carbon Content of Gas (%w/w)'
      label :gas_carbon
      path 'gasCarbon'
      value '0.17'
      optional!
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the carbon content (% by mass) of blast furnace gas transferred offsite during the reporting period'
    }

    profile {
      name 'Carbon Content of Iron (%w/w)'
      label :iron_carbon
      path 'ironCarbon'
      value '0.04'
      optional!
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the carbon content (% by mass) of iron not converted into steel during the reporting period'
    }

    profile {
      name 'Carbon Content of Steel (%w/w)'
      label :steel_carbon
      path 'steelCarbon'
      value '0.01'
      optional!
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the carbon content (% by mass) of steel produced during the reporting period'
    }

    profile {
      name 'CH4 Emission Factor'
      label :ch4_em
      path 'ch4EM'
      value '0.0'
      optional!
      default_unit :kg
      default_per_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      per_unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of CH4 emitted per unit of sinter produced during the reporting period'
    }

    output {
      name 'CH4'
      label :ch4
      path 'CH4'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CH4 emissions calculated based on data entered for each scenario.'
    }

    output {
      name 'CO2'
      label :co2
      path 'CO2'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2 emissions calculated based on data entered for each scenario'
    }

    output {
      name 'CO2e'
      label :co2e
      path 'CO2e'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2'
    }

    metadatum {
      name 'Note'
      label :note
      path 'note'
      value 'This methodology enables the calculation of CO2, CH4 and CO2e emissions associated with Iron and Steel production'
      interface :drop_down
      hide!
    }

    metadatum {
      name 'Reporting period'
      label :reporting_period
      path 'reporting_period'
      interface :text_box
      note 'Provide a reference for the reporting period under consideration'
    }

  }

  calculation {

    name 'Onsite lime production'
    label :onsite_lime
    path '/business/processes/production/lime/carbonate'

    drill {
      name 'Carbonate Type'
      label :carbonate_type
      path 'carbonateType'
      interface :drop_down
      note 'Select the type of carbonate feedstock consumed during the reporting period'
    }

    profile {
      name 'Carbonate-specific Emission Factor'
      label :ef
      path 'EF'
      optional!
      type :decimal
      interface :text_box
      note 'Specify the quantity of CO2 produced per unit of carbonate consumed during the reporting period'
    }

    profile {
      name 'Fraction Calcination achieved for Carbonate'
      label :calcination_frac
      path 'calcinationFrac'
      value '1.0'
      optional!
      type :decimal
      interface :text_box
      note 'Specify the fraction (decimal fraction; 0-1) calcination acheived for the carbon feedstock consumed during the reporting period'
    }

    profile {
      name 'Fraction Calcination achieved for LKD'
      label :lkd_calc_frac
      path 'lkdCalcFrac'
      value '1.0'
      optional!
      type :decimal
      interface :text_box
      note 'Specify the fraction (decimal fraction; 0-1) calcination acheived for lime kiln dust during the reporting period'
    }

    profile {
      name 'Quantity of Carbonate'
      label :carbonate_quantity
      path 'carbonateQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of carbonate feedstock consumed during the reporting period'
    }

    profile {
      name 'Quantity of LKD'
      label :lkd_quantity
      path 'lkdQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of lime kiln dust produced during the reporting period'
    }

    profile {
      name 'Weight Fraction of Original Carbonate in LKD'
      label :weight_lkd
      path 'weightLkd'
      value '1.0'
      type :decimal
      interface :text_box
      note 'Specify the quantity (decimal fraction by weight; 0-1) of original carbonate in lime kiln dust during the reporting period'
    }

    output {
      name 'CO2'
      label :co2
      path 'CO2'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2 emissions calculated based on data entered for each scenario'
    }

    metadatum {
      name 'Note'
      label :note
      path 'note'
      value 'This methodology enables the calculation of CO2 emissions associated with onsite lime production'
      interface :drop_down
      hide!
    }

    metadatum {
      name 'Reporting period'
      label :reporting_period
      path 'reporting_period'
      interface :text_box
      note 'Provide a reference for the reporting period under consideration'
    }

  }

  calculation {

    name 'Offsite lime production'
    label :offsite_lime
    path '/business/processes/production/lime/production'

    drill {
      name 'Lime Type'
      label :lime_type
      path 'limeType'
      interface :drop_down
      note 'Select the type of lime produced during the reporting period'
    }

    profile {
      name 'Fraction Calcination of the Original Carbonate in the LKD'
      label :calcination_lkd
      path 'calcinationLKD'
      optional!
      type :decimal
      interface :text_box
      note 'Specify the fraction of calcination achieved for the carbonates in lime kiln dust, as a decimal fraction (0-1). If not specified, an industry typical value is used.'
    }

    profile {
      name 'Fraction CaO/CaO.MgO content'
      label :cao_mgo_ratio
      path 'caoMgoRatio'
      optional!
      type :decimal
      interface :text_box
      note 'Specify the CaO or CaO·MgO content of the lime, as a decimal fraction (0-1). If not specified, an industry typical value is used'
    }

    profile {
      name 'Fraction of Original Carbonate in the LKD'
      label :frac_lkd
      path 'fracLkd'
      optional!
      type :decimal
      interface :text_box
      note 'Specify the original carbonate content of lime kiln dust, as a decimal fraction (0-1). If not specified, an industry typical value is used'
    }

    profile {
      name 'Proportion of Hydrated Lime'
      label :hyd_lime
      path 'hydLime'
      value '0.1'
      optional!
      type :decimal
      interface :text_box
      note 'Specify the proportion of the produced lime which is hydrated, as a decimal fraction (0-1). If not specified, an industry typical value is used'
    }

    profile {
      name 'Quantity of Lime'
      label :lime_quantity
      path 'limeQuantity'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of lime produced during the reporting period'
    }

    profile {
      name 'Stoichometric Ratio'
      label :stoic_ratio
      path 'stoicRatio'
      optional!
      type :decimal
      interface :text_box
      note 'Specify the stoichiometric ratio (as a decimal fraction; 0-1) between the calcination products CaO or CaO·MgO and CO2. If not specified, an industry typical value is used'
    }

    profile {
      name 'Water Content of Hydrated Lime'
      label :water_lime
      path 'waterLime'
      value '0.28'
      optional!
      type :decimal
      interface :text_box
      note 'Specify the water content of hydrated lime, as a decimal fraction (0-1). If not specified, an industry typical value is used'
    }

    profile {
      name 'Weight of LKD Not Recycled to Kiln'
      label :lkd_weight
      path 'lkdWeight'
      optional!
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      type :decimal
      interface :text_box
      note 'Specify the quantity of lime kiln dust not return to the lime kiln. If not specified, an industry typical value is used'
    }

    output {
      name 'CO2'
      label :co2
      path 'CO2'
      default_unit :kg
      alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
      unit :kg
      note 'CO2 emissions calculated based on data (facility-specific and default) entered for each scenario'
    }

    metadatum {
      name 'Note'
      label :note
      path 'note'
      value 'This methodology can be used to calculate the CO2 emissions associated with the offsite production of lime.'
      interface :drop_down
      hide!
    }

    metadatum {
      name 'Reporting period'
      label :reporting_period
      path 'reporting_period'
      interface :text_box
      note 'Provide a reference for the reporting period under consideration'
    }

  }

}
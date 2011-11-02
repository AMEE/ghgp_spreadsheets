calculation {

  name "Methodology using ammonia production and CO2 recovered for urea production"
  label :ammonia_production_and_co2_recovery
  path "/business/processes/production/ammonia"

  drill {
    name "Plant type"
    label :plant
    path "plant"
    interface :drop_down
    note "Select the type of plant"
  }

  drill {
    name "Production process"
    label :prod_process
    path "prodProcess"
    interface :drop_down
    note "Select the type of production process"
  }

  drill {
    name "Fuel type"
    label :fuel
    path "fuel"
    interface :drop_down
    note "Select the type of fuel used"
  }

  profile {
    name "Fraction of carbon oxidised"
    label :oxidation_fact
    path "oxidationFact"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the proportion of carbon oxidised, as a decimal fraction (0-1)"
  }

  profile {
    name "Fuel carbon content"
    label :carbon_content
    path "carbonContent"
    optional!
    default_unit :kg
    default_per_unit :GJ
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :J, :kWh, :MJ, :TJ, :BTU_FiftyNineF, :MBTU_FiftyNineF, :MWh
    unit :kg
    per_unit :GJ
    type :decimal
    interface :text_box
    note "Specify the carbon content of the fuel used in terms of a mass of carbon per energy yielded"
  }

  profile {
    name "Fuel requirement per unit production"
    label :fuel_quantity
    path "fuelQuantity"
    optional!
    default_unit :GJ
    default_per_unit :kg
    alternative_units :J, :kWh, :MJ, :TJ, :BTU_FiftyNineF, :MBTU_FiftyNineF, :MWh
    alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :GJ
    per_unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of fuel consumed per unit of ammonia produced"
  }

  profile {
    name "Quantity of ammonia produced"
    label :nh3_quantity
    path "nh3Quantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of ammonia produced"
  }

  profile {
    name "Quantity of CO2 recovered for storage"
    label :css
    path "css"
    value "0.0"
    optional!
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of CO2 recovered for carbon storage and sequestration"
  }

  profile {
    name "Quantity of CO2 recovered for urea production"
    label :urea_prod
    path "ureaProd"
    optional!
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of CO2 recovered for urea production"
  }

  output {
    name "CO2"
    label :co2
    path "default"
    type :decimal
    note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario"
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This approach enables the calculation of CO2 emissions associated with ammonia production based on quantities of ammonia produced and CO2 recovered for urea production."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Facility ID"
    label :facility_id
    path "facility_id"
    type :string
    interface :text_box
    note "Provide a reference for the facility under consideration"
  }

  metadatum {
    name "Unit ID"
    label :unit_id
    path "unit_id"
    type :string
    interface :text_box
    note "Provide a reference for the unit under consideration"
  }

}

calculation {

  name "Methodology using ammonia and urea production"
  label :ammonia_and_urea_production
  path "/business/processes/production/ammonia"

  drill {
    name "Plant type"
    label :plant
    path "plant"
    interface :drop_down
    note "Select the type of plant"
  }

  drill {
    name "Production process"
    label :prod_process
    path "prodProcess"
    interface :drop_down
    note "Select the type of production process"
  }

  drill {
    name "Fuel type"
    label :fuel
    path "fuel"
    interface :drop_down
    note "Select the type of fuel used"
  }

  profile {
    name "Fraction of carbon oxidised"
    label :oxidation_fact
    path "oxidationFact"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the proportion of carbon oxidised, as a decimal fraction (0-1)"
  }

  profile {
    name "Fuel carbon content"
    label :carbon_content
    path "carbonContent"
    optional!
    default_unit :kg
    default_per_unit :GJ
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :J, :kWh, :MJ, :TJ, :BTU_FiftyNineF, :MBTU_FiftyNineF, :MWh
    unit :kg
    per_unit :GJ
    type :decimal
    interface :text_box
    note "Specify the carbon content of the fuel used in terms of a mass of carbon per energy yielded"
  }

  profile {
    name "Fuel requirement per unit production"
    label :fuel_quantity
    path "fuelQuantity"
    optional!
    default_unit :GJ
    default_per_unit :kg
    alternative_units :J, :kWh, :MJ, :TJ, :BTU_FiftyNineF, :MBTU_FiftyNineF, :MWh
    alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :GJ
    per_unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of fuel consumed per unit of ammonia produced"
  }

  profile {
    name "Quantity of ammonia produced"
    label :nh3_quantity
    path "nh3Quantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of ammonia produced"
  }

  profile {
    name "Quantity of CO2 recovered for storage"
    label :css
    path "css"
    value "0.0"
    optional!
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of CO2 recovered for carbon storage and sequestration"
  }

  profile {
    name "Quantity of urea produced"
    label :quantity_urea
    path "quantityUrea"
    optional!
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of urea produced"
  }

  output {
    name "CO2"
    label :co2
    path "default"
    type :decimal
    note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario"
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This approach enables the calculation of CO2 emissions associated with ammonia production based on quantities of ammonia and urea produced."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Facility ID"
    label :facility_id
    path "facility_id"
    type :string
    interface :text_box
    note "Provide a reference for the facility under consideration"
  }

  metadatum {
    name "Unit ID"
    label :unit_id
    path "unit_id"
    type :string
    interface :text_box
    note "Provide a reference for the unit under consideration"
  }

}

calculation {

  name "Methodology using fuel consumption and CO2 recovered for urea production"
  label :ammonia_fuel_consumption_and_recovery
  path "/business/processes/production/ammonia"

  drill {
    name "Plant type"
    label :plant
    path "plant"
    interface :drop_down
    note "Select the type of plant"
  }

  drill {
    name "Production process"
    label :prod_process
    path "prodProcess"
    interface :drop_down
    note "Select the type of production process"
  }

  drill {
    name "Fuel type"
    label :fuel
    path "fuel"
    interface :drop_down
    note "Select the type of fuel used"
  }

  profile {
    name "Fraction of carbon oxidised"
    label :oxidation_fact
    path "oxidationFact"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the proportion of carbon oxidised, as a decimal fraction (0-1)"
  }

  profile {
    name "Fuel carbon content"
    label :carbon_content
    path "carbonContent"
    optional!
    default_unit :kg
    default_per_unit :GJ
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :J, :kWh, :MJ, :TJ, :BTU_FiftyNineF, :MBTU_FiftyNineF, :MWh
    unit :kg
    per_unit :GJ
    type :decimal
    interface :text_box
    note "Specify the carbon content of the fuel used in terms of a mass of carbon per energy yielded"
  }

  profile {
    name "Quantity of CO2 recovered for storage"
    label :css
    path "css"
    value "0.0"
    optional!
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of CO2 recovered for carbon storage and sequestration"
  }

  profile {
    name "Quantity of CO2 recovered for urea production"
    label :urea_prod
    path "ureaProd"
    optional!
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of CO2 recovered for urea production"
  }

  profile {
    name "Total fuel requirement"
    label :total_fuel_quantity
    path "totalFuelQuantity"
    default_unit :GJ
    alternative_units :J, :kWh, :MJ, :TJ, :BTU_FiftyNineF, :MBTU_FiftyNineF, :MWh
    unit :GJ
    type :decimal
    interface :text_box
    note "Specify the absolute quantity of fuel consumed in terms of a quantity of energy"
  }

  output {
    name "CO2"
    label :co2
    path "default"
    type :decimal
    note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario"
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This approach enables the calculation of CO2 emissions associated with ammonia production based on quantities of fuel consumed and CO2 recovered for urea production."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Facility ID"
    label :facility_id
    path "facility_id"
    type :string
    interface :text_box
    note "Provide a reference for the facility under consideration"
  }

  metadatum {
    name "Unit ID"
    label :unit_id
    path "unit_id"
    type :string
    interface :text_box
    note "Provide a reference for the unit under consideration"
  }

}

calculation {

  name "Methodology using fuel consumption and urea production"
  label :ammonia_fuel_consumption_and_urea_production
  path "/business/processes/production/ammonia"

  drill {
    name "Plant type"
    label :plant
    path "plant"
    interface :drop_down
    note "Select the type of plant"
  }

  drill {
    name "Production process"
    label :prod_process
    path "prodProcess"
    interface :drop_down
    note "Select the type of production process"
  }

  drill {
    name "Fuel type"
    label :fuel
    path "fuel"
    interface :drop_down
    note "Select the type of fuel used"
  }

  profile {
    name "Fraction of carbon oxidised"
    label :oxidation_fact
    path "oxidationFact"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the proportion of carbon oxidised, as a decimal fraction (0-1)"
  }

  profile {
    name "Fuel carbon content"
    label :carbon_content
    path "carbonContent"
    optional!
    default_unit :kg
    default_per_unit :GJ
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :J, :kWh, :MJ, :TJ, :BTU_FiftyNineF, :MBTU_FiftyNineF, :MWh
    unit :kg
    per_unit :GJ
    type :decimal
    interface :text_box
    note "Specify the carbon content of the fuel used in terms of a mass of carbon per energy yielded"
  }

  profile {
    name "Quantity of CO2 recovered for storage"
    label :css
    path "css"
    value "0.0"
    optional!
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of CO2 recovered for carbon storage and sequestration"
  }

  profile {
    name "Quantity of urea produced"
    label :quantity_urea
    path "quantityUrea"
    optional!
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of urea produced"
  }

  profile {
    name "Total fuel requirement"
    label :total_fuel_quantity
    path "totalFuelQuantity"
    default_unit :GJ
    alternative_units :J, :kWh, :MJ, :TJ, :BTU_FiftyNineF, :MBTU_FiftyNineF, :MWh
    unit :GJ
    type :decimal
    interface :text_box
    note "Specify the absolute quantity of fuel consumed in terms of a quantity of energy"
  }

  output {
    name "CO2"
    label :co2
    path "default"
    type :decimal
    note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario"
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This approach enables the calculation of CO2 emissions associated with ammonia production based on quantities of fuel consumed and urea produced."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Facility ID"
    label :facility_id
    path "facility_id"
    type :string
    interface :text_box
    note "Provide a reference for the facility under consideration"
  }

  metadatum {
    name "Unit ID"
    label :unit_id
    path "unit_id"
    type :string
    interface :text_box
    note "Provide a reference for the unit under consideration"
  }

}


all_calculations {
  metadatum {
    name 'Facility ID'
    label :facility_id
    interface :text_box
    note "Provide a reference for the facility under consideration"
  }

  metadatum {
    name 'Unit ID'
    label :unit_id
    interface :text_box
    note "Provide a reference for the unit under consideration"
  }
  # Correct titles for outputs
  correcting(:co2)   { name "CO2" }
}

calculation {
  name 'Methodology using ammonia production and CO2 recovered for urea production'
  label :ammonia_production_and_co2_recovery
  path '/business/processes/production/ammonia'
  terms_from_amee 'ammoniaProductionAndCO2Recovery'
  
  output {
    label :co2
    name 'Carbon Dioxide'
    path :default
    type :decimal
  }

  correcting(:comment) { hide! }

  correcting(:plant)          {note "Select the type of plant"}
  correcting(:prod_process)   {note "Select the type of production process"}
  correcting(:fuel)           {note "Select the type of fuel used"}
  correcting(:oxidation_fact) {note "Specify the proportion of carbon oxidised, as a decimal fraction (0-1)"}
  correcting(:carbon_content) {note "Specify the carbon content of the fuel used in terms of a mass of carbon per energy yielded"}
  correcting(:fuel_quantity)  {note "Specify the quantity of fuel consumed per unit of ammonia produced"}
  correcting(:nh3_quantity)   {note "Specify the quantity of ammonia produced"}
  correcting(:css)            {note "Specify the quantity of CO2 recovered for carbon storage and sequestration"}
  correcting(:urea_prod)      {note "Specify the quantity of CO2 recovered for urea production"}
  correcting(:co2)            { note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario" }

  metadatum {
    label :note
    value "This approach enables the calculation of CO2 emissions associated with ammonia production based on quantities of ammonia produced and CO2 recovered for urea production."
    hide!
  }
}

calculation {
  name 'Methodology using ammonia and urea production'
  label :ammonia_and_urea_production
  path '/business/processes/production/ammonia'
  terms_from_amee 'ammoniaAndUreaProduction'

  output {
    label :co2
    name 'Carbon Dioxide'
    path :default
    type :decimal
  }

  correcting(:comment) { hide! }

  correcting(:plant)          {note "Select the type of plant"}
  correcting(:prod_process)   {note "Select the type of production process"}
  correcting(:fuel)           {note "Select the type of fuel used"}
  correcting(:oxidation_fact) {note "Specify the proportion of carbon oxidised, as a decimal fraction (0-1)"}
  correcting(:carbon_content) {note "Specify the carbon content of the fuel used in terms of a mass of carbon per energy yielded"}
  correcting(:fuel_quantity)  {note "Specify the quantity of fuel consumed per unit of ammonia produced"}
  correcting(:nh3_quantity)   {note "Specify the quantity of ammonia produced"}
  correcting(:css)            {note "Specify the quantity of CO2 recovered for carbon storage and sequestration"}
  correcting(:quantity_urea)  {note "Specify the quantity of urea produced"}
  correcting(:co2)            { note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario" }

  metadatum {
    label :note
    value "This approach enables the calculation of CO2 emissions associated with ammonia production based on quantities of ammonia and urea produced."
    hide!
  }
}

calculation {
  name 'Methodology using fuel consumption and CO2 recovered for urea production'
  label :ammonia_fuel_consumption_and_recovery
  path '/business/processes/production/ammonia'
  terms_from_amee 'fuelConsumptionAndCO2Recovery'

  output {
    label :co2
    name 'Carbon Dioxide'
    path :default
    type :decimal
  }

  correcting(:comment) { hide! }

  correcting(:plant)                {note "Select the type of plant"}
  correcting(:prod_process)         {note "Select the type of production process"}
  correcting(:fuel)                 {note "Select the type of fuel used"}
  correcting(:oxidation_fact)       {note "Specify the proportion of carbon oxidised, as a decimal fraction (0-1)"}
  correcting(:carbon_content)       {note "Specify the carbon content of the fuel used in terms of a mass of carbon per energy yielded"}
  correcting(:total_fuel_quantity)  {note "Specify the absolute quantity of fuel consumed in terms of a quantity of energy"}
  correcting(:nh3_quantity)         {note "Specify the quantity of ammonia produced"}
  correcting(:css)                  {note "Specify the quantity of CO2 recovered for carbon storage and sequestration"}
  correcting(:urea_prod)            {note "Specify the quantity of CO2 recovered for urea production"}
  correcting(:co2)                  { note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario" }

  metadatum {
    label :note
    value "This approach enables the calculation of CO2 emissions associated with ammonia production based on quantities of fuel consumed and CO2 recovered for urea production."
    hide!
  }
}

calculation {
  name 'Methodology using fuel consumption and urea production'
  label :ammonia_fuel_consumption_and_urea_production
  path '/business/processes/production/ammonia'
  terms_from_amee 'fuelConsumptionAndUreaProduction'

  output {
    label :co2
    name 'Carbon Dioxide'
    path :default
    type :decimal
  }

  correcting(:comment) { hide! }

  correcting(:plant)                {note "Select the type of plant"}
  correcting(:prod_process)         {note "Select the type of production process"}
  correcting(:fuel)                 {note "Select the type of fuel used"}
  correcting(:oxidation_fact)       {note "Specify the proportion of carbon oxidised, as a decimal fraction (0-1)"}
  correcting(:carbon_content)       {note "Specify the carbon content of the fuel used in terms of a mass of carbon per energy yielded"}
  correcting(:total_fuel_quantity)  {note "Specify the absolute quantity of fuel consumed in terms of a quantity of energy"}
  correcting(:nh3_quantity)         {note "Specify the quantity of ammonia produced"}
  correcting(:css)                  {note "Specify the quantity of CO2 recovered for carbon storage and sequestration"}
  correcting(:quantity_urea)        {note "Specify the quantity of urea produced"}
  correcting(:co2)                  { note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario" }

  metadatum {
    label :note
    value "This approach enables the calculation of CO2 emissions associated with ammonia production based on quantities of fuel consumed and urea produced."
    hide!
  }
}
all_calculations {
  metadatum {
    name 'Reporting period'
    label :reporting_period
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
    type 'string'
  }

  # Correct titles for outputs
  correcting(:co2)     { name "CO2" }
  correcting(:ch4)     { name "CH4" }
  correcting(:co2e)    { name "CO2e" }
  correcting(:n2_o)    { name "N2O"}
  correcting(:bio_co2) { name "Biogenic CO2" }
}

calculation {
  name "By fuel"
  label :transport_fuel
  path "/transport/ghgp/fuel"
  terms_from_amee 'default'
  correcting (:comment) { hide! }

  correcting(:co2)     {note "CO2 emissions calculated based on data entered for each scenario"}
  correcting(:bio_co2) {note "Biogenic CO2 emissions calculated based on data entered for each scenario."}

  metadatum {
    label :note
    value "This methodology enables the calculation of CO2 and biogenic CO2 associated with the mobile combustion of fuels on the basis of fuel quantity."
    hide!
  }
}

calculation {
  name "Freight transport"
  label :transport_freight
  path "/transport/ghgp/freight"
  terms_from_amee 'default'
  correcting (:comment) { hide! }

  correcting(:co2)     {note "CO2 emissions calculated based on data entered for each scenario"}
  correcting(:co2e)    {note "CO2e emissions calculated based on data entered for each scenario. This represents the combined effect of all greenhouse gas emissions, expressed in terms of the equivalent quantity of CO2"}
  correcting(:ch4)     {note "CH4 emissions calculated based on data entered for each scenario."}
  correcting(:n2_o)    {note "N2O emissions calculated based on data entered for each scenario."}
  
  metadatum {
    label :note
    value "This methodology enables the calculation of CO2 and biogenic CO2 associated with the freight transport."
    hide!
  }
}
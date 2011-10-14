all_calculations {
 
  # Correct titles for outputs
  correcting(:n2_o)   { name "N2O" }
  correcting(:co2e)   { name "CO2e" }
}

calculation {
  name 'N2O emissions based on nitric acid production'
  label :nitric_acid_production
  path '/business/processes/production/nitricAcid'
  terms_from_amee 'default'
  correcting(:comment) { hide! }

  correcting(:plant_type)    { note "Select the type of technology used at the plant." }
  correcting(:destr_fact)    { note "Specify the efficiency (the fraction of emissions abated; 0-1) of abatement technologies." }
  correcting(:abate_fact)    { note "Specify the fraction of production (0-1) which employs abatement technologies (abatement utilization factor)." }    
  correcting(:spec_em_fact)  { note "Specify the quantity of N2O produced per unit of nitric acid produced." }
  correcting(:acid_quantity) { note "Specify the quantity of nitric acid produced." }
  correcting(:co2e)          { note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. This represents N2O emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect."}
  correcting(:n2_o)          { note "N2O emissions calculated based on data (facility-specific and default) entered for each scenario." }


  metadatum {
    label :note
    value "This approach enables the calculation of N2O (and CO2e) emissions associated with nitric acid production based on the quantity of nitric acid produced"
    hide!
  }
}

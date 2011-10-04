Calculations=
  AMEE::DataAbstraction::CalculationSet.new {
  all_calculations {
   
    # Correct titles for outputs
    correcting(:n2_o)   { name "N2O" }
    correcting(:co2e)   { name "CO2e" }
  }

  calculation {
    name 'Direct N2O emissions from adipic acid production'
    label :adipic_acid
    path '/business/processes/production/adipicAcid'
    terms_from_amee 'default'
    correcting(:comment) { hide! }

    correcting(:abatement_technology) { note "Select the type of abatement technology used during operation." }
    correcting(:destr_fact)           { note "Specify the efficiency (the fraction of emissions abated; 0-1) of the selected abatement technology." }
    correcting(:abate_fact)           { note "Specify the fraction of production (0-1) which employs abatement technologies (abatement utilization factor)." }    
    correcting(:em_fact)              { note "Specify the quantity of N2O produced per unit of adipic acid produced." }
    correcting(:adipic_quantity)      { note "Specify the quantity of adipic acid produced." }
    correcting(:co2e)                 { note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. This represents N2O emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect."}
    correcting(:n2_o)                 { note "N2O emissions calculated based on data (facility-specific and default) entered for each scenario." }

    metadatum {
      label :note
      value "This approach enables the calculation of direct N2O (and CO2e) emissions associated with adipic acid production. Calculations are differentiated by the type of abatement technology used (including no abatement)"
      hide!
    }
  }

}


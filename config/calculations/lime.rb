Calculations=
  AMEE::DataAbstraction::CalculationSet.new {
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
    name 'CO2 emissions based on lime production'
    label :lime_production_methodology
    path '/business/processes/production/lime/production'
    terms_from_amee 'default'
    correcting(:comment) { hide! }

    metadatum {
      label :note
      value "This approach can be used to calculate the CO2 emissions associated with the production of lime based on production data. Calculations are differentiated by the type of lime and the facility/unit under consideration"
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

  calculation {
    name 'CO2 emissions based on carbonate consumption'
    label :lime_carbonate_methodology
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
      value "This approach enables the calculation of CO2 emissions associated with lime production based on the consumption of carbonate materials. Calculations are differentiated by the type of carbonate and the facility/unit under consideration"
      hide!
    }
  }

}


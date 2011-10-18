calculation {

  name "CO2 emissions based on lime production"
  label :lime_production_methodology
  path "/business/processes/production/lime/production"

  drill {
    name "Lime Type"
    label :lime_type
    path "limeType"
    interface :drop_down
    note "Select the type of lime produced during the reporting period"
  }

  profile {
    name "Fraction Calcination of the Original Carbonate in the LKD"
    label :calcination_lkd
    path "calcinationLKD"
    optional!
    type :decimal
    interface :text_box
    note "Specify the fraction of calcination achieved for the carbonates in lime kiln dust, as a decimal fraction (0-1). If not specified, an industry typical value is used."
  }

  profile {
    name "Fraction CaO/CaO.MgO content"
    label :cao_mgo_ratio
    path "caoMgoRatio"
    optional!
    type :decimal
    interface :text_box
    note "Specify the CaO or CaO·MgO content of the lime, as a decimal fraction (0-1). If not specified, an industry typical value is used"
  }

  profile {
    name "Fraction of Original Carbonate in the LKD"
    label :frac_lkd
    path "fracLkd"
    optional!
    type :decimal
    interface :text_box
    note "Specify the original carbonate content of lime kiln dust, as a decimal fraction (0-1). If not specified, an industry typical value is used"
  }

  profile {
    name "Proportion of Hydrated Lime"
    label :hyd_lime
    path "hydLime"
    value "0.1"
    optional!
    type :decimal
    interface :text_box
    note "Specify the proportion of the produced lime which is hydrated, as a decimal fraction (0-1). If not specified, an industry typical value is used"
  }

  profile {
    name "Quantity of Lime"
    label :lime_quantity
    path "limeQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of lime produced during the reporting period"
  }

  profile {
    name "Stoichometric Ratio"
    label :stoic_ratio
    path "stoicRatio"
    optional!
    type :decimal
    interface :text_box
    note "Specify the stoichiometric ratio (as a decimal fraction; 0-1) between the calcination products CaO or CaO·MgO and CO2. If not specified, an industry typical value is used"
  }

  profile {
    name "Water Content of Hydrated Lime"
    label :water_lime
    path "waterLime"
    value "0.28"
    optional!
    type :decimal
    interface :text_box
    note "Specify the water content of hydrated lime, as a decimal fraction (0-1). If not specified, an industry typical value is used"
  }

  profile {
    name "Weight of LKD Not Recycled to Kiln"
    label :lkd_weight
    path "lkdWeight"
    optional!
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of lime kiln dust not return to the lime kiln. If not specified, an industry typical value is used"
  }

  output {
    name "CO2"
    label :co2
    path "CO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario"
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This approach can be used to calculate the CO2 emissions associated with the production of lime based on production data."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Facility ID"
    label :facility_id
    path "facility_id"
    interface :text_box
    note "Provide a reference for the facility under consideration"
  }

  metadatum {
    name "Unit ID"
    label :unit_id
    path "unit_id"
    interface :text_box
    note "Provide a reference for the unit under consideration"
  }

}

calculation {

  name "CO2 emissions based on carbonate consumption"
  label :lime_carbonate_methodology
  path "/business/processes/production/lime/carbonate"

  drill {
    name "Carbonate Type"
    label :carbonate_type
    path "carbonateType"
    interface :drop_down
    note "Select the type of carbonate feedstock consumed during the reporting period"
  }

  profile {
    name "Carbonate-specific Emission Factor"
    label :ef
    path "EF"
    optional!
    type :decimal
    interface :text_box
    note "Specify the quantity of CO2 produced per unit of carbonate consumed during the reporting period"
  }

  profile {
    name "Fraction Calcination achieved for Carbonate"
    label :calcination_frac
    path "calcinationFrac"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the fraction (decimal fraction; 0-1) calcination acheived for the carbon feedstock consumed during the reporting period"
  }

  profile {
    name "Fraction Calcination achieved for LKD"
    label :lkd_calc_frac
    path "lkdCalcFrac"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the fraction (decimal fraction; 0-1) calcination acheived for lime kiln dust during the reporting period"
  }

  profile {
    name "Quantity of Carbonate"
    label :carbonate_quantity
    path "carbonateQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of carbonate feedstock consumed during the reporting period"
  }

  profile {
    name "Quantity of LKD"
    label :lkd_quantity
    path "lkdQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of lime kiln dust produced during the reporting period"
  }

  profile {
    name "Weight Fraction of Original Carbonate in LKD"
    label :weight_lkd
    path "weightLkd"
    value "1.0"
    type :decimal
    interface :text_box
    note "Specify the quantity (decimal fraction by weight; 0-1) of original carbonate in lime kiln dust during the reporting period"
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

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This approach enables the calculation of CO2 emissions associated with lime production based on the consumption of carbonate materials."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Facility ID"
    label :facility_id
    path "facility_id"
    interface :text_box
    note "Provide a reference for the facility under consideration"
  }

  metadatum {
    name "Unit ID"
    label :unit_id
    path "unit_id"
    interface :text_box
    note "Provide a reference for the unit under consideration"
  }

}


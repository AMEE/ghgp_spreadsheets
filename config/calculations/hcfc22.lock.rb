calculation {

  name "Methodology based on HCFC-22 production"
  label :hcfc22_production
  path "/business/processes/production/hcfc22/productionDataOnly"

  drill {
    name "Type"
    label :type
    path "type"
    interface :drop_down
    note "Select the type of plant"
  }

  profile {
    name "Amount of HCFC-22 Produced"
    label :quantity_hcfc22
    path "quantityHCFC22"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of HCFC-22 produced"
  }

  profile {
    name "Fraction of Time HFC-23 is Released to Atmosphere Untreated"
    label :time_hfc23
    path "timeHFC23"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the fraction of time HFC-23 is released to the atmosphere untreated (decimal fraction; 0-1)"
  }

  profile {
    name "HFC-23 Emission Factor"
    label :emiss_fact
    path "emissFact"
    optional!
    default_unit :kg
    default_per_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    per_unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of HFC-23 emitted per unit of HCFC-22 produced"
  }

  output {
    name "CO2e"
    label :co2e
    path "CO2e"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. These represent HFC-23 emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect."
  }

  output {
    name "HFC23"
    label :hfc23
    path "HFC23"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "HFC-23 emissions calculated based on data (facility-specific and default) entered for each scenario."
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This approach enables the calculation of HFC-23 emissions associated with HCFC-22 production based on quantities of HCFC-22 production."
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

  name "Methodology based on fluorine and carbon balance efficiencies"
  label :hcfc22_balance_efficiencies
  path "/business/processes/production/hcfc22/fluorineAndCarbon"

  drill {
    name "Type"
    label :type
    path "type"
    interface :drop_down
    hide!
  }

  profile {
    name "Amount of HCFC-22 Produced"
    label :quantity_hcfc22
    path "quantityHCFC22"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of HCFC-22 produced"
  }

  profile {
    name "Carbon Balance Efficiency (%)"
    label :carbon_bal_eff
    path "carbonBalEff"
    type :decimal
    interface :text_box
    note "Specify the carbon balance efficiency (whole percentage; 0-100)"
  }

  profile {
    name "Carbon Content Factor"
    label :carbon_cont_fact
    path "carbonContFact"
    value "0.81"
    optional!
    type :decimal
    interface :text_box
    note "Specify the carbon content factor (decimal percentage; 0-1)"
  }

  profile {
    name "Fluorine Balance Efficiency (%)"
    label :fluorine_bal_eff
    path "fluorineBalEff"
    type :decimal
    interface :text_box
    note "Specify the fluorine balance efficiency (whole percentage; 0-100)"
  }

  profile {
    name "Fluorine Content Factor"
    label :fluorine_cont_fact
    path "fluorineContFact"
    value "0.54"
    optional!
    type :decimal
    interface :text_box
    note "Specify the fluorine content factor (decimal percentage; 0-1)"
  }

  profile {
    name "Fraction of Time HFC-23 is Released to Atmosphere Untreated"
    label :time_hfc23
    path "timeHFC23"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the fraction of time HFC-23 is released to the atmosphere untreated (decimal fraction; 0-1)"
  }

  profile {
    name "Loss of HCFC-22 Production Efficiency due to HFC-23 Production (fraction)"
    label :loss_hcfc22
    path "lossHCFC22"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the fraction of HCFC-22 production efficiency loss due to co-produciton of HFC-23. Default = 1 (i.e. all losses in process efficiency due to produciton of HFC-23)"
  }

  output {
    name "CO2e"
    label :co2e
    path "CO2e"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. These represent HFC-23 emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect."
  }

  output {
    name "HFC23"
    label :hfc23
    path "HFC23"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "HFC-23 emissions calculated based on data (facility-specific and default) entered for each scenario."
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This approach enables the calculation of HFC-23 emissions associated with HCFC-22 production based on carbon and fluorine balance efficiencies."
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

  name "Methodology based on gas stream properties"
  label :hcfc22_gas_stream
  path "/business/processes/production/hcfc22/gasStream"

  drill {
    name "Type"
    label :type
    path "type"
    interface :drop_down
    hide!
  }

  profile {
    name "Amount of Time HFC-23 Flows"
    label :time_flow
    path "timeFlow"
    default_unit :min
    alternative_units :s, :h, :month, :week, :year, :day
    unit :min
    type :decimal
    interface :text_box
    note "Specify the amount of time HFC-22 flows"
  }

  profile {
    name "HFC-23 Emissions Flow Rate"
    label :emiss_flow_rate
    path "emissFlowRate"
    default_unit :m³
    default_per_unit :min
    alternative_units :L, :bbl, :oz_fl_uk, :gal_uk, :gallon_dry_us, :oz_fl, :bbl_fl_us, :gal
    alternative_per_units :s, :h, :month, :week, :year, :day
    unit :m³
    per_unit :min
    type :decimal
    interface :text_box
    note "Specify the emissions flow rate"
  }

  profile {
    name "HFC-23 Flow Concentration"
    label :flow_concentration
    path "flowConcentration"
    default_unit :g
    default_per_unit :m³
    alternative_units :kg, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :L, :bbl, :oz_fl_uk, :gal_uk, :gallon_dry_us, :oz_fl, :bbl_fl_us, :gal
    unit :g
    per_unit :m³
    type :decimal
    interface :text_box
    note "Specify the flow concentration of HFC-23"
  }

  output {
    name "CO2e"
    label :co2e
    path "CO2e"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. These represent HFC-23 emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect."
  }

  output {
    name "HFC23"
    label :hfc23
    path "HFC23"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "HFC-23 emissions calculated based on data (facility-specific and default) entered for each scenario."
  }

  metadatum {
    name "Stream ID"
    label :stream_id
    path "stream_id"
    interface :text_box
    note "Provide a reference for the stream under consideration"
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This approach enables the calculation of HFC-23 emissions associated with HCFC-22 production based properties of plant gas streams."
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


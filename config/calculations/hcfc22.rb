# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

all_calculations {

  metadatum {
    name 'Facility ID'
    label :facility_id
    interface :text_box
    note "Provide a reference for the facility under consideration"
    type 'string'
  }

  metadatum {
    name 'Unit ID'
    label :unit_id
    interface :text_box
    note "Provide a reference for the unit under consideration"
    type 'string'
  }
 
  # Correct titles for outputs
  correcting(:co2e)   { name "CO2e" }
  correcting(:hfc23)   { name "HFC23" }
}

calculation {
  name 'Methodology based on HCFC-22 production'
  label :hcfc22_production
  path '/business/processes/production/hcfc22/productionDataOnly'
  terms_from_amee 'default'

  correcting(:comment) { hide! }

  correcting(:type)            { note "Select the type of plant"}
  correcting(:quantity_hcfc22) { note "Specify the quantity of HCFC-22 produced" }
  correcting(:time_hfc23)      { note "Specify the fraction of time HFC-23 is released to the atmosphere untreated (decimal fraction; 0-1)" }
  correcting(:emiss_fact)      { note "Specify the quantity of HFC-23 emitted per unit of HCFC-22 produced" }
  correcting(:hfc23)           { note "HFC-23 emissions calculated based on data (facility-specific and default) entered for each scenario." }
  correcting(:co2e)            { note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. These represent HFC-23 emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect." }

  metadatum {
    label :note
    value "This approach enables the calculation of HFC-23 emissions associated with HCFC-22 production based on quantities of HCFC-22 production."
    hide!
  }
}

calculation {
  name 'Methodology based on fluorine and carbon balance efficiencies'
  label :hcfc22_balance_efficiencies
  path '/business/processes/production/hcfc22/fluorineAndCarbon'
  terms_from_amee 'default'
  correcting(:comment) { hide! }
  correcting(:type) { hide! }

  correcting(:quantity_hcfc22)    { note "Specify the quantity of HCFC-22 produced" }
  correcting(:carbon_bal_eff)     { note "Specify the carbon balance efficiency (whole percentage; 0-100)" }
  correcting(:carbon_cont_fact)   { note "Specify the carbon content factor (decimal percentage; 0-1)" }
  correcting(:fluorine_bal_eff)   { note "Specify the fluorine balance efficiency (whole percentage; 0-100)" }
  correcting(:fluorine_cont_fact) { note "Specify the fluorine content factor (decimal percentage; 0-1)" }
  correcting(:time_hfc23)         { note "Specify the fraction of time HFC-23 is released to the atmosphere untreated (decimal fraction; 0-1)" }
  correcting(:loss_hcfc22)        { note "Specify the fraction of HCFC-22 production efficiency loss due to co-produciton of HFC-23. Default = 1 (i.e. all losses in process efficiency due to produciton of HFC-23)" }
  correcting(:hfc23)              { note "HFC-23 emissions calculated based on data (facility-specific and default) entered for each scenario." }
  correcting(:co2e)               { note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. These represent HFC-23 emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect." }

  metadatum {
    label :note
    value "This approach enables the calculation of HFC-23 emissions associated with HCFC-22 production based on carbon and fluorine balance efficiencies."
    hide!
  }
}

calculation {
  name 'Methodology based on gas stream properties'
  label :hcfc22_gas_stream
  path '/business/processes/production/hcfc22/gasStream'
  terms_from_amee 'default'
  correcting(:comment) { hide! }
  correcting(:type) { hide! }

  correcting(:time_flow)          { note "Specify the amount of time HFC-22 flows" }
  correcting(:emiss_flow_rate)    { note "Specify the emissions flow rate" }
  correcting(:flow_concentration) { note "Specify the flow concentration of HFC-23" }
  correcting(:hfc23)              { note "HFC-23 emissions calculated based on data (facility-specific and default) entered for each scenario." }
  correcting(:co2e)               { note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. These represent HFC-23 emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect." }


  metadatum {
    name 'Stream ID'
    label :stream_id
    interface :text_box
    note "Provide a reference for the stream under consideration"
    type 'string'
  }

  metadatum {
    label :note
    value "This approach enables the calculation of HFC-23 emissions associated with HCFC-22 production based properties of plant gas streams."
    hide!
  }
}

all_calculations {
  metadatum {
    name 'Reporting period'
    label :reporting_period
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
    type 'string'
  }

  # Correct titles for outputs
  correcting(:co2)   { name "CO2" }
  correcting(:co2e)  { name "CO2e" }
  correcting(:c2_f6) { name "C2F6" }
  correcting(:cf4)   { name "CF4" }
}

calculation {
  name 'Default approach for electrolysis CO2'
  label :aluminium_default_electrolysis_co2
  path '/business/processes/production/aluminium/defaults'
  terms_from_amee 'default'
  correcting(:comment) { hide! }

  metadatum {
    label :note
    value "This approach enables the calculation of CO2 emissions associated with electrolysis processes. It should be used if quantities of carbon containing materials are not known."
    hide!
  }
  correcting(:process_type) { note "Select the type of process potline for which data is being entered" }
  correcting(:aluminium_quantity) { note "Specify the quantity of aluminium produced for each process and during each reporting period" }
  correcting(:emis_fact) { note "Specify the rate of CO2 emissions per quantity of aluminium produced (i.e. the \"emissions factor\") if a facility specific value is known. If no data is specified, a default emissions factor is used" }
  correcting(:co2) { note "CO2 emissions calcualted as a result of multiplying the weight of aluminium produced by the facility specific or default emissions factor" }
}

calculation {
  name 'Søderberg electrolysis CO2'
  label :aluminium_soderberg
  path '/business/processes/production/aluminium/soderberg'
  terms_from_amee 'default'
  correcting(:comment) { hide! }
  
  metadatum {
    label :note
    value "This approach enables the calculation of Søderberg-associated CO2 emissions based on the carbon (C) contained within the Søderberg paste. If quantities of Søderberg paste are unknown, use the 'alternative' methodology."
    hide!
  }
  correcting(:soderberg_type) { note "Select the type of Søderberg potline for which data is being entered" }
  correcting(:paste_type) { note "Select the type of paste used" }
  correcting(:aluminium_quantity) { note "Specify the quantity of aluminium produced for the process type and reporting period under consideration" }
  correcting(:anode_quantity) { note "Specify the quantity of anode paste used per quantity of aluminium produced" }
  correcting(:cyclo_quantity) { note "Specify the quantity of cyclohexane soluble matter emitted per quantity of aluminium produced. If no value is specified, an industry typical default value is used" }
  correcting(:carbon_dust) { note "Specify the quantity of carbon dust emitted per quantity of aluminium produced. If no value is specified, an industry typical default value is used" }
  correcting(:ash_coke) { note "Specify the ash content of coke used in anode formulation (0-100%). If no value is specified, an industry typical default value is used" }
  correcting(:sulphur_coke) { note "Specify the sulpur content of coke used in anode formulation (0-100%). If no value is specified, an industry typical default value is used" }
  correcting(:binder_quantity) { note "Specify the average binder content of anode paste (0-100%). If no value is specified, an industry typical default value is used" }
  correcting(:ash_pitch) { note "Specify the ash content of pitch used in anode formulation (0-100%). If no value is specified, an industry typical default value is used" }
  correcting(:hyd_pitch) { note "Specify the hydrogen content of pitch used in anode formulation (0-100%). If no value is specified, an industry typical default value is used" }
  correcting(:sulphur_pitch) { note "Specify the sulphur content of pitch used in anode formulation (0-100%). If no value is specified, an industry typical default value is used" }
  correcting(:co2) { note "CO2 emissions calculated based on data (facility-specific and default) entered for each Søderberg scenario" }
}

calculation {
  name 'Prebake electrolysis CO2'
  label :aluminium_prebake
  path '/business/processes/production/aluminium/prebake/electrolysis'
  terms_from_amee 'default'
  correcting(:type) { hide! }
  correcting(:comment) { hide! }
  
  metadatum {
    label :note
    value "This approach enables the calculation of prebaked electrolysis-associated CO2 emissions based on the carbon (C) contained within the prebaked anodes. If net anode consumption is unknown or not reliable, use the 'alternative' methodology."
    hide!
  }
  metadatum {
    name 'Potline ID'
    label :potline_id
    interface :text_box
    note "Provide a reference for the potline for which data is being entered"
    type 'string'
  }
  correcting(:anode_quantity) { note "Specify the quantity of anode paste used per quantity of aluminium produced" }
  correcting(:aluminium_quantity) { note "Specify the quantity of aluminium produced for the process type and reporting period under consideration" }
  correcting(:ash_quantity) { note "Specify the ash content of baked anodes (0-100%). If no value is specified, an industry typical default value is used" }
  correcting(:sulphur_quantity) { note "Specify the sulpur content of baked anodes (0-100%). If no value is specified, an industry typical default value is used" }
  correcting(:co2) { note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario" }
}
calculation {
  name 'Anode baking CO2 (default waste tar quantity)'
  label :aluminium_pitchcook_default_tar
  path '/business/processes/production/aluminium/prebake/pitchCooking'
  terms_from_amee 'defaultWasteTarQuantity'
  correcting(:comment) { hide! }
  
  metadatum {
    name 'Furnace ID'
    label :furnace_id
    interface :text_box
    note "Provide a reference for the furnace for which data is being entered"
    type 'string'
  }
  metadatum {
    label :note
    value "This methodology enables the calculation of CO2 emissions associated with pitch volatiles combustion and packing material in the anode baking furnace. If net anode consumption is unknown or not reliable, use the 'alternative' methodology."
    hide!
  }
  correcting(:type) { note "Select the type of furnace for which data is being entered" }
  correcting(:green_weight) { note "Specify the average weight of green anodes. This, in conjunction with the weight of baked anodes, determines the weight loss during baking" }
  correcting(:baked_weight) { note "Specify the average weight of baked anodes. This, in conjunction with the weight of green anodes, determines the weight loss during baking" }
  correcting(:anode_quantity) { note "Specify the quantity of baked anodes produced" }
  correcting(:ash_quantity) { note "Specify the ash content of packing coke used. If no value is specified, an industry typical default value is used" }
  correcting(:hyd_content) { note "Specify the average hydrogen content of green anodes (0-100%). This can be calculated by multiplying the hydrogen fraction of pitch by the pitch fraction in green anodes. If no value is specified, an industry typical default value is used" }
  correcting(:coke_quantity) { note "Specify the quantity of packing coke consumed per quantity of baked anode produced. If no value is specified, an industry typical default value is used" }
  correcting(:tar_quantity) { note "Specify the quantity of waste tar collected from the furnace. If no value is specified, an industry typical default value is used" }
  correcting(:sulphur_quantity) { note "Specify the sulphur content of packing coke used. If no value is specified, an industry typical default value is used" }
  correcting(:co2) { note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario" }
}

calculation {
  name 'Anode baking CO2 (default anode weight)'
  label :aluminium_pitchcook_default_anode
  path '/business/processes/production/aluminium/prebake/pitchcooking'
  terms_from_amee 'defaultAnodeWeight'
  correcting(:comment) { hide! }
  
  metadatum {
    name 'Furnace ID'
    label :furnace_id
    interface :text_box
    note "Provide a reference for the furnace for which data is being entered"
    type 'string'
  }
  metadatum {
    label :note
    value "This methodology enables the calculation of CO2 emissions associated with pitch volatiles combustion and packing material in the anode baking furnace. If net anode consumption is unknown or not reliable, use the 'alternative' methodology."
    hide!
  }
  correcting(:type) { note "Select the type of furnace for which data is being entered" }
  correcting(:green_weight) { note "Specify the average weight of green anodes. This, in conjunction with the weight of baked anodes, determines the weight loss during baking" }
  correcting(:baked_weight) { note "Specify the average weight of baked anodes. This, in conjunction with the weight of green anodes, determines the weight loss during baking" }
  correcting(:anode_quantity) { note "Specify the quantity of baked anodes produced" }
  correcting(:ash_quantity) { note "Specify the ash content of packing coke used. If no value is specified, an industry typical default value is used" }
  correcting(:hyd_content) { note "Specify the average hydrogen content of green anodes (0-100%). This can be calculated by multiplying the hydrogen fraction of pitch by the pitch fraction in green anodes. If no value is specified, an industry typical default value is used" }
  correcting(:coke_quantity) { note "Specify the quantity of packing coke consumed per quantity of baked anode produced. If no value is specified, an industry typical default value is used" }
  correcting(:tar_quantity) { note "Specify the quantity of waste tar collected from the furnace. If no value is specified, an industry typical default value is used" }
  correcting(:sulphur_quantity) { note "Specify the sulphur content of packing coke used. If no value is specified, an industry typical default value is used" }
  correcting(:co2) { note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario" }
}

calculation {
  name 'Alternative approach for electrolysis CO2'
  label :aluminium_alternative_electrolysis
  path '/business/processes/production/aluminium/alternative'
  terms_from_amee 'default'
  correcting(:type) { hide! }
  correcting(:comment) { hide! }
  
  metadatum {
    label :note
    value "The methodology represents an alternative approach to calculating electrolysis process CO2 emissions based on the consumption of carbon containing materials. If quantities of purchased carbon containing materials aren't known, use the 'default' method."
    hide!
  }
  correcting(:byprod_quantity) { note "Specify the quantity of carbon contained within process by-products or waste" }
  correcting(:coke_quantity) { note "Specify the total quantity of coke consumed during the process" }
  correcting(:anode_quantity) { note "Specify the quantity of purchased anodes during the process" }
  correcting(:sold_quantity) { note "Specify the quantity of anodes sold during the process" }
  correcting(:packing_quantity) { note "Specify the quantity of packing coke consumed during the process" }
  correcting(:pitch_quantity) { note "Specify the quantity of pitch consumed during the process" }
  correcting(:carbon_coke) { note "Specify the carbon content of consumed coke, as a weight percentage (0-100). If no value is specified, an industry typical default value is used" }
  correcting(:carbon_pitch) { note "Specify the carbon content of consumed pitch, as a weight percentage (0-100). If no value is specified, an industry typical default value is used" }
  correcting(:carbon_packing) { note "Specify the carbon content of consumed packing coke, as a weight percentage (0-100). If no value is specified, an industry typical default value is used" }
  correcting(:carbon_anode) { note "Specify the carbon content of purchased anodes, as a weight percentage (0-100). If no value is specified, an industry typical default value is used" }
  correcting(:carbon_sold) { note "Specify the carbon content of sold anodes, as a weight percentage (0-100). If no value is specified, an industry typical default value is used" }
  correcting(:co2) { note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario" }
}

calculation {
  name 'Coke calcination'
  label :aluminium_coke_calcination
  path '/business/processes/production/aluminium/coke'
  terms_from_amee 'default'
  correcting(:type) { hide! }
  correcting(:comment) { hide! }
  
  metadatum {
    label :note
    value "This methodology can be used to calculate the CO2 emissions associated with the calcining of coke."
    hide!
  }
  correcting(:mass_green_coke) { note "Specify the quantity of green coke calcined during the reporting period" }
  correcting(:mass_calcined_coke_produced) { note "Specify the total quantity of calcined coke produced from green coke during the reporting period. If unknown, either a facility-specific or default value for the quantity of calcined coke produced per quantity of green coke can be used." }
  correcting(:mass_calcined_coke_produced_per_mass) { note "Specify the quantity of calcined coke produced per quantity of green coke consumed. If this is unknown, an industry typical value is used. If the quantity of calcined coke is explicitly specified, this value is ignored." }
  correcting(:mass_coke_dust) { note "Specify the quantity of coke dust emitted during the calcining process. If unknown, either a facility-specific or default value for the quantity of coke dust produced per quantity of green coke can be used." }
  correcting(:mass_coke_dust_per_mass) { note "Specify the quantity of coke dust produced per quantity of green coke consumed. If this is unknown, an industry typical value is used. If the quantity of coke dust recovered is explicitly specified, this value is ignored." }
  correcting(:green_coke_methane_content) { note "Specify the methane content of green coke consumed, as a weight percentage (0-100). If unknown, an industry typical default value is used." }
  correcting(:green_coke_moisture_content) { note "Specify the moisture content of green coke consumed, as a weight percentage (0-100). If no value is specified, an industry typical default value is used" }
  correcting(:green_coke_sulphur_content) { note "Specify the sulphur content of green coke consumed, as a weight percentage (0-100). If no value is specified, an industry typical default value is used" }
  correcting(:green_coke_volatiles_content) { note "Specify the volatiles content of green coke consumed, as a weight percentage (0-100). If no value is specified, an industry typical default value is used" }
  correcting(:green_coke_moisture_content) { note "Specify the moisture content of green coke consumed, as a weight percentage (0-100). If no value is specified, an industry typical default value is used" }
  correcting(:under_calcined_coke_collected) { note "Specify the quantity of undercalcined coke recovered from the calcining process. If unspecified, this value is assumed to be 0." }
  correcting(:calcined_coke_sulphur) { note "Specify the sulphur content of the calcined coke, as a weight percentage (0-100). If no value is specified, an industry typical default value is used" }
  correcting(:co2) { note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario" }
}

calculation {
  name 'Soda ash consumption'
  label :aluminium_soda_ash
  path '/business/processes/production/aluminium/sodaAsh'
  terms_from_amee 'default'
  correcting(:type) { hide! }
  correcting(:comment) { hide! }

  metadatum {
    label :note
    value "This methodology can be used to calculate the CO2 emissions associated with the consumption of soda ash."
    hide!
  }
  correcting(:soda_quantity) { note "Specify the quantity of soda ash consumed during the reporting period" }
  correcting(:calc_frac) { note "Specify the fraction of calcination achieved, as a decimal fraction (0-1). If not specified, this value is assumed to be 1, i.e. that soda ash is completely calcined." }
  correcting(:soda_frac) { note "Specify the purity of soda ash, as a decimal fraction (0-1). If not specified, an industry typical value is used" }
  correcting(:co2) { note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario" }
}

calculation {
  name 'Lime production'
  label :aluminium_lime_production
  path '/business/processes/production/lime/production'
  terms_from_amee 'default'
  correcting(:comment) { hide! }
  
  metadatum {
    label :note
    value "This methodology can be used to calculate the CO2 emissions associated with the production of lime."
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
  name 'Default approach for electrolysis PFCs'
  label :aluminium_default_electrolysis_pfc
  path '/business/processes/production/aluminium/pfc/defaults'
  terms_from_amee 'default'
  correcting (:comment) { hide! }
  
  metadatum {
    name 'Potline ID'
    label :potline_id
    interface :text_box
    note "Provide a reference for the potline for which data is being entered"
    type 'string'
  }
  metadatum {
    label :note
    value "This methodology enables the calculation of electrolysis-associated CF4 and C2F6 emissions on the basis of emissions factors. It should be used only when anode effect process data is unavailable."
    hide!
  }
  correcting(:cell_type) { note "Select the type of electrolysis cell used during the reporting period." }
  correcting(:al_quantity) { note "Specify the quantity of aluminium produced during the reporting period." }
  correcting(:c2f6_emis_fact) { note "Specify the quantity of C2F6 emitted per quantity of aluminium produced. If not specified, an industry typical value is used." }
  correcting(:cf4_emis_fact) { note "Specify the quantity of C2F6 emitted per quantity of aluminium produced. If not specified, an industry typical value is used." }
  correcting(:c2_f6) { note "C2F6 emissions calculated based on data (facility-specific and default) entered for each scenario." }
  correcting(:cf4) { note "CF4 emissions calculated based on data (facility-specific and default) entered for each scenario." }
  correcting(:co2e) { note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. These represent CF4 and C2F6 emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect." }
}

calculation {
  name 'Slope approach for electrolysis PFCs'
  label :aluminium_slope_electrolysis_pfc
  path '/business/processes/production/aluminium/pfc/slope'
  terms_from_amee 'default'
  correcting (:comment) { hide! }

  metadatum {
    name 'Potline ID'
    label :potline_id
    interface :text_box
    note "Provide a reference for the potline for which data is being entered"
    type 'string'
  }
  metadatum {
    label :note
    value "This methodology enables the calculation of electrolysis-associated CF4 and C2F6 emissions on the basis of the 'slope' method."
    hide!
  }
  correcting(:cell_type) { note "Select the type of electrolysis cell used during the reporting period." }
  correcting(:al_quantity) { note "Specify the quantity of aluminium produced during the reporting period." }
  correcting(:aem) { note "Specify the average duration of anode effect for the reporting period." }
  correcting(:aef) { hide! }
  correcting(:weight_frac) { note "Specify the ratio of weights for CF4 and C2F6. If not specified, an industry typical value is used." }
  correcting(:cf4_coef) { note "Specify the slope coefficient for CF4. If not specified, an industry typical value is used." }
  correcting(:c2_f6) { note "C2F6 emissions calculated based on data (facility-specific and default) entered for each scenario." }
  correcting(:cf4) { note "CF4 emissions calculated based on data (facility-specific and default) entered for each scenario." }
  correcting(:co2e) { note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. These represent CF4 and C2F6 emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect." }
}

calculation {
  name 'Overvoltage approach for electrolysis PFCs'
  label :aluminium_overvoltage_electrolysis_pfc
  path '/business/processes/production/aluminium/pfc/overvoltage'
  terms_from_amee 'default'
  correcting (:comment) { hide! }

  metadatum {
    name 'Potline ID'
    label :potline_id
    interface :text_box
    note "Provide a reference for the potline for which data is being entered"
    type 'string'
  }
  metadatum {
    label :note
    value "This methodology enables the calculation of electrolysis-associated CF4 and C2F6 emissions on the basis of the 'overvoltage' method."
    hide!
  }
  correcting(:cell_type) { note "Select the type of electrolysis cell used during the reporting period." }
  correcting(:al_quantity) { note "Specify the quantity of aluminium produced during the reporting period." }
  correcting(:aeo) { note "Specify the average anode effect overvoltage per cell for the reporting period." }
  correcting(:cur_eff) { note "Specify the current efficiency, as a percentage (0-100)." }
  correcting(:weight_frac) { note "Specify the ratio of weights for CF4 and C2F6. If not specified, an industry typical value is used." }
  correcting(:ov_coef) { note "Specify the overvoltage coefficient for CF4. If not specified, an industry typical value is used." }
  correcting(:c2_f6) { note "C2F6 emissions calculated based on data (facility-specific and default) entered for each scenario." }
  correcting(:cf4) { note "CF4 emissions calculated based on data (facility-specific and default) entered for each scenario." }
  correcting(:co2e) { note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. These represent CF4 and C2F6 emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect." }
}
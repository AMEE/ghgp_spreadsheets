Calculations=
  AMEE::DataAbstraction::CalculationSet.new {
  all_calculations {
    metadatum {
      name 'Reporting period'
      label :reporting_period
      interface :text_box
      note "Provide a reference for the reporting period under consideration"
    }

    # Correct titles for outputs
    correcting(:co2) { name "CO2"}
    correcting(:co2e) { name "CO2e"}
    correcting(:c2_f6) { name "C2F6"}
    correcting(:cf4) { name "CF4"}
  }

  calculation {
    name 'Default methodology for electrolysis CO2'
    label :default_co2
    path '/business/processes/production/aluminium/defaults'
    terms_from_amee 'default'
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
    metadatum {
      label :note
      value "This methodology should be used if quantities of carbon containing materials are not known. Calculations are differentiated by the type of process potline used and the reporting period under consideration"
      hide!
    }
    correcting(:process_type) { note "Select the type of process potline for which data is being entered" }
    correcting(:aluminium_quantity) { note "Specify the quantity of aluminium produced for each process and during each reporting period" }
    correcting(:emis_fact) { note "Specify the rate of CO2 emissions per quantity of aluminium produced (i.e. the 'emissions factor') if a facility specific value is known. If no data is specified, a default emissions factor is used" }
    correcting(:co2) { note "CO2 emissions calcualted as a result of multiplying the weight of aluminium produced by the facility specific or default emissions factor" }
  }

  calculation {
    name 'Soderberg electrolysis CO2'
    label :soderberg
    path '/business/processes/production/aluminium/soderberg'
    terms_from_amee 'default'
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
    metadatum {
      label :note
      value "If quantities of Soderberg paste are unknown, use the 'alternative' methodology. Calculations are differentiated by the types of process potline and anode paste used and the reporting period under consideration"
      hide!
    }
    correcting(:soderberg_type) { note "Select the type of Soderberg potline for which data is being entered" }
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
    correcting(:co2) { note "CO2 emissions calculated based on data (facility-specific and default) entered for each Soderberg scenario" }
  }
  
  calculation {
    name 'Prebake electrolysis CO2'
    label :prebake
    path '/business/processes/production/aluminium/prebake/electrolysis'
    terms_from_amee 'default'
    correcting(:type) { hide! }
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
    metadatum {
      label :note
      value "If net anode consumption (gross consumption minus anode butts) is unknown or not reliable, use the 'alternative' methodology. Calculations are differentiated by the reporting period under consideration"
      hide!
    }
    metadatum {
      name 'Potline ID'
      label :potline_id
      interface :text_box
      note "Provide a reference for the potline for which data is being entered"
    }
    correcting(:anode_quantity) { note "Specify the quantity of anode paste used per quantity of aluminium produced" }
    correcting(:aluminium_quantity) { note "Specify the quantity of aluminium produced for the process type and reporting period under consideration" }
    correcting(:ash_quantity) { note "Specify the ash content of baked anodes (0-100%). If no value is specified, an industry typical default value is used" }
    correcting(:sulphur_quantity) { note "Specify the sulpur content of baked anodes (0-100%). If no value is specified, an industry typical default value is used" }
    correcting(:co2) { note "CO2 emissions calculated based on data (facility-specific and default) entered for each scenario" }
  }
  calculation {
    name 'Anode baking CO2 with default waste tar values'
    label :pitchcook_default_tar
    path '/business/processes/production/aluminium/prebake/pitchcooking'
    terms_from_amee 'defaultWasteTarQuantity'
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
    metadatum {
      name 'Furnace ID'
      label :furnace_id
      interface :text_box
      note "Provide a reference for the furnace for which data is being entered"
    }
    metadatum {
      label :note
      value "If net anode consumption (gross consumption minus anode butts) is unknown or not reliable, use the 'alternative' methodology. Calculations are differentiated by the types of furnace used and the reporting period under consideration"
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
    correcting(:co2) { note "CO2 emissions calculated based on data (facility-specific and default) entered for each Soderberg scenario" }
  }

  calculation {
    name 'Anode baking CO2 with default anode weights'
    label :pitchcook_default_anode
    path '/business/processes/production/aluminium/prebake/pitchcooking'
    terms_from_amee 'defaultAnodeWeight'
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
    metadatum {
      name 'Furnace ID'
      label :furnace_id
      interface :text_box
      note "Provide a reference for the furnace for which data is being entered"
    }
    metadatum {
      label :note
      value "If net anode consumption (gross consumption minus anode butts) is unknown or not reliable, use the 'alternative' methodology. Calculations are differentiated by the types of furnace used and the reporting period under consideration"
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
    correcting(:co2) { note "CO2 emissions calculated based on data (facility-specific and default) entered for each Soderberg scenario" }
  }

  calculation {
    name 'Alternative CO2'
    label :alternative
    path '/business/processes/production/aluminium/alternative'
    terms_from_amee 'default'
    correcting (:type) { hide! }
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
    metadatum {
      label :note
      value "The methodology represents an alternative approach to calculating electrolysis process CO2 emissions based on the consumption of carbon containing materials. If quantities of purchased carbon containing materials are not known, use the 'default' methodology. Calculations are differentiated by the reporting period under consideration"
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
    correcting(:co2) { note "CO2 emissions calculated based on data (facility-specific and default) entered for each Soderberg scenario" }
  }
  calculation {
    name 'Coke calcination'
    label :coke
    path '/business/processes/production/aluminium/coke'
    terms_from_amee 'default'
    correcting(:type) { hide! }
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
  }
  calculation {
    name 'Soda Ash'
    label :soda_ash
    path '/business/processes/production/lime/production'
    terms_from_amee 'default'
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
  }
  calculation {
    name 'Default PFCs'
    label :default_pfc
    path '/business/processes/production/aluminium/pfc/defaults'
    terms_from_amee 'default'
    correcting (:comment) { hide! }
    metadatum {
      name 'Potline ID'
      label :potline_id
      interface :text_box
    }
  }
  calculation {
    name 'Slope PFCs'
    label :slope_pfc
    path '/business/processes/production/aluminium/pfc/slope'
    terms_from_amee 'default'
    correcting (:comment) { hide! }
    metadatum {
      name 'Potline ID'
      label :potline_id
      interface :text_box
    }
  }
  calculation {
    name 'Overvoltage PFCs'
    label :overvoltage_pfc
    path '/business/processes/production/aluminium/pfc/overvoltage'
    terms_from_amee 'default'
    correcting (:comment) { hide! }
    metadatum {
      name 'Potline ID'
      label :potline_id
      interface :text_box
    }
  }
}

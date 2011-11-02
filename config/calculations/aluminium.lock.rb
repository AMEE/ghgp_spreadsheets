calculation {

  name "Default approach for electrolysis CO2"
  label :aluminium_default_electrolysis_co2
  path "/business/processes/production/aluminium/defaults"

  drill {
    name "Type of cell technology"
    label :process_type
    path "processType"
    interface :drop_down
    note "Select the type of process potline for which data is being entered"
  }

  profile {
    name "CO2 emissions per unit production"
    label :emis_fact
    path "emisFact"
    optional!
    default_unit :kg
    default_per_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    per_unit :kg
    type :decimal
    interface :text_box
    note "Specify the rate of CO2 emissions per quantity of aluminium produced (i.e. the 'emissions factor') if a facility specific value is known. If no data is specified, a default emissions factor is used"
  }

  profile {
    name "Quantity of aluminium produced"
    label :aluminium_quantity
    path "aluminiumQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of aluminium produced for each process and during each reporting period"
  }

  output {
    name "CO2"
    label :co2
    path "CO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2 emissions calcualted as a result of multiplying the weight of aluminium produced by the facility specific or default emissions factor"
  }

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This approach enables the calculation of CO2 emissions associated with electrolysis processes. It should be used if quantities of carbon containing materials are not known."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}

calculation {

  name "Søderberg electrolysis CO2"
  label :aluminium_soderberg
  path "/business/processes/production/aluminium/soderberg"

  drill {
    name "Type of Soderberg potline"
    label :soderberg_type
    path "soderbergType"
    interface :drop_down
    note "Select the type of Søderberg potline for which data is being entered"
  }

  drill {
    name "Type of paste"
    label :paste_type
    path "pasteType"
    interface :drop_down
    note "Select the type of paste used"
  }

  profile {
    name "Anode paste consumption per unit production"
    label :anode_quantity
    path "anodeQuantity"
    default_unit :kg
    default_per_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    per_unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of anode paste used per quantity of aluminium produced"
  }

  profile {
    name "Carbon dust collected per unit production"
    label :carbon_dust
    path "carbonDust"
    value "0.01"
    optional!
    default_unit :kg
    default_per_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    per_unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of carbon dust emitted per quantity of aluminium produced. If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Coke ash content (%)"
    label :ash_coke
    path "ashCoke"
    value "0.2"
    optional!
    type :decimal
    interface :text_box
    note "Specify the ash content of coke used in anode formulation (0-100%). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Coke sulphur content (%)"
    label :sulphur_coke
    path "sulphurCoke"
    value "1.9"
    optional!
    type :decimal
    interface :text_box
    note "Specify the sulpur content of coke used in anode formulation (0-100%). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Cyclohexane soluble matter emitted per unit production"
    label :cyclo_quantity
    path "cycloQuantity"
    optional!
    default_unit :kg
    default_per_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    per_unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of cyclohexane soluble matter emitted per quantity of aluminium produced. If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Paste binder content (%)"
    label :binder_quantity
    path "binderQuantity"
    optional!
    type :decimal
    interface :text_box
    note "Specify the average binder content of anode paste (0-100%). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Pitch ash content (%)"
    label :ash_pitch
    path "ashPitch"
    value "0.2"
    optional!
    type :decimal
    interface :text_box
    note "Specify the ash content of pitch used in anode formulation (0-100%). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Pitch hydrogen content (%)"
    label :hyd_pitch
    path "hydPitch"
    value "3.3"
    optional!
    type :decimal
    interface :text_box
    note "Specify the hydrogen content of pitch used in anode formulation (0-100%). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Pitch sulphur content (%)"
    label :sulphur_pitch
    path "sulphurPitch"
    value "0.6"
    optional!
    type :decimal
    interface :text_box
    note "Specify the sulphur content of pitch used in anode formulation (0-100%). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Quantity of aluminium produced"
    label :aluminium_quantity
    path "aluminiumQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of aluminium produced for the process type and reporting period under consideration"
  }

  output {
    name "CO2"
    label :co2
    path "CO2"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2 emissions calculated based on data (facility-specific and default) entered for each Søderberg scenario"
  }

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This approach enables the calculation of Søderberg-associated CO2 emissions based on the carbon (C) contained within the Søderberg paste. If quantities of Søderberg paste are unknown, use the 'alternative' methodology."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}

calculation {

  name "Prebake electrolysis CO2"
  label :aluminium_prebake
  path "/business/processes/production/aluminium/prebake/electrolysis"

  drill {
    name "Type"
    label :type
    path "type"
    interface :drop_down
    hide!
  }

  profile {
    name "Baked Anode ash content (%)"
    label :ash_quantity
    path "ashQuantity"
    value "0.4"
    optional!
    type :decimal
    interface :text_box
    note "Specify the ash content of baked anodes (0-100%). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Baked anode consumption per unit production"
    label :anode_quantity
    path "anodeQuantity"
    default_unit :kg
    default_per_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    per_unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of anode paste used per quantity of aluminium produced"
  }

  profile {
    name "Baked Anode sulphur content (%)"
    label :sulphur_quantity
    path "sulphurQuantity"
    value "2.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the sulpur content of baked anodes (0-100%). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Quantity of aluminium produced"
    label :aluminium_quantity
    path "aluminiumQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of aluminium produced for the process type and reporting period under consideration"
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

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This approach enables the calculation of prebaked electrolysis-associated CO2 emissions based on the carbon (C) contained within the prebaked anodes. If net anode consumption is unknown or not reliable, use the 'alternative' methodology."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Potline ID"
    label :potline_id
    path "potline_id"
    type :string
    interface :text_box
    note "Provide a reference for the potline for which data is being entered"
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}

calculation {

  name "Anode baking CO2 (default waste tar quantity)"
  label :aluminium_pitchcook_default_tar
  path "/business/processes/production/aluminium/prebake/pitchCooking"

  drill {
    name "Type"
    label :type
    path "type"
    interface :drop_down
    note "Select the type of furnace for which data is being entered"
  }

  profile {
    name "Ash content of packing coke (%)"
    label :ash_quantity
    path "ashQuantity"
    value "2.5"
    optional!
    type :decimal
    interface :text_box
    note "Specify the ash content of packing coke used. If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Average process weight of baked anodes"
    label :baked_weight
    path "bakedWeight"
    optional!
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the average weight of baked anodes. This, in conjunction with the weight of green anodes, determines the weight loss during baking"
  }

  profile {
    name "Average process weight of green anodes"
    label :green_weight
    path "greenWeight"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the average weight of green anodes. This, in conjunction with the weight of baked anodes, determines the weight loss during baking"
  }

  profile {
    name "Green anode hydrogen content (%)"
    label :hyd_content
    path "hydContent"
    value "0.5"
    optional!
    type :decimal
    interface :text_box
    note "Specify the average hydrogen content of green anodes (0-100%). This can be calculated by multiplying the hydrogen fraction of pitch by the pitch fraction in green anodes. If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Packing coke consumed per unit production"
    label :coke_quantity
    path "cokeQuantity"
    value "0.015"
    optional!
    default_unit :kg
    default_per_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    per_unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of packing coke consumed per quantity of baked anode produced. If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Quantity of baked anodes produced"
    label :anode_quantity
    path "anodeQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of baked anodes produced"
  }

  profile {
    name "Quantity of waste tar collected"
    label :tar_quantity
    path "tarQuantity"
    optional!
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of waste tar collected from the furnace. If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Sulphur content of packing coke (%)"
    label :sulphur_quantity
    path "sulphurQuantity"
    value "2.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the sulphur content of packing coke used. If no value is specified, an industry typical default value is used"
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

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Furnace ID"
    label :furnace_id
    path "furnace_id"
    type :string
    interface :text_box
    note "Provide a reference for the furnace for which data is being entered"
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology enables the calculation of CO2 emissions associated with pitch volatiles combustion and packing material in the anode baking furnace. If net anode consumption is unknown or not reliable, use the 'alternative' methodology."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}

calculation {

  name "Anode baking CO2 (default anode weight)"
  label :aluminium_pitchcook_default_anode
  path "/business/processes/production/aluminium/prebake/pitchcooking"

  drill {
    name "Type"
    label :type
    path "type"
    interface :drop_down
    note "Select the type of furnace for which data is being entered"
  }

  profile {
    name "Ash content of packing coke (%)"
    label :ash_quantity
    path "ashQuantity"
    value "2.5"
    optional!
    type :decimal
    interface :text_box
    note "Specify the ash content of packing coke used. If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Average process weight of baked anodes"
    label :baked_weight
    path "bakedWeight"
    optional!
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the average weight of baked anodes. This, in conjunction with the weight of green anodes, determines the weight loss during baking"
  }

  profile {
    name "Average process weight of green anodes"
    label :green_weight
    path "greenWeight"
    optional!
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the average weight of green anodes. This, in conjunction with the weight of baked anodes, determines the weight loss during baking"
  }

  profile {
    name "Green anode hydrogen content (%)"
    label :hyd_content
    path "hydContent"
    value "0.5"
    optional!
    type :decimal
    interface :text_box
    note "Specify the average hydrogen content of green anodes (0-100%). This can be calculated by multiplying the hydrogen fraction of pitch by the pitch fraction in green anodes. If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Packing coke consumed per unit production"
    label :coke_quantity
    path "cokeQuantity"
    value "0.015"
    optional!
    default_unit :kg
    default_per_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    per_unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of packing coke consumed per quantity of baked anode produced. If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Quantity of baked anodes produced"
    label :anode_quantity
    path "anodeQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of baked anodes produced"
  }

  profile {
    name "Quantity of waste tar collected"
    label :tar_quantity
    path "tarQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of waste tar collected from the furnace. If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Sulphur content of packing coke (%)"
    label :sulphur_quantity
    path "sulphurQuantity"
    value "2.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the sulphur content of packing coke used. If no value is specified, an industry typical default value is used"
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

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Furnace ID"
    label :furnace_id
    path "furnace_id"
    type :string
    interface :text_box
    note "Provide a reference for the furnace for which data is being entered"
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology enables the calculation of CO2 emissions associated with pitch volatiles combustion and packing material in the anode baking furnace. If net anode consumption is unknown or not reliable, use the 'alternative' methodology."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}

calculation {

  name "Alternative approach for electrolysis CO2"
  label :aluminium_alternative_electrolysis
  path "/business/processes/production/aluminium/alternative"

  drill {
    name "Type"
    label :type
    path "type"
    interface :drop_down
    hide!
  }

  profile {
    name "Percentage Carbon Content of Coke"
    label :carbon_coke
    path "carbonCoke"
    value "98.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the carbon content of consumed coke, as a weight percentage (0-100). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Percentage Carbon Content of Packing Coke"
    label :carbon_packing
    path "carbonPacking"
    value "97.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the carbon content of consumed packing coke, as a weight percentage (0-100). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Percentage Carbon Content of Pitch"
    label :carbon_pitch
    path "carbonPitch"
    value "95.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the carbon content of consumed pitch, as a weight percentage (0-100). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Percentage Carbon Content of Purchased Anodes"
    label :carbon_anode
    path "carbonAnode"
    value "98.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the carbon content of purchased anodes, as a weight percentage (0-100). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Percentage Carbon Content of Sold Anodes"
    label :carbon_sold
    path "carbonSold"
    value "98.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the carbon content of sold anodes, as a weight percentage (0-100). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Total Carbon By-Products or Waste"
    label :byprod_quantity
    path "byprodQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of carbon contained within process by-products or waste"
  }

  profile {
    name "Total Coke Consumption"
    label :coke_quantity
    path "cokeQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the total quantity of coke consumed during the process"
  }

  profile {
    name "Total Mass of Purchased Anodes"
    label :anode_quantity
    path "anodeQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of purchased anodes during the process"
  }

  profile {
    name "Total Mass of Sold Anodes"
    label :sold_quantity
    path "soldQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of anodes sold during the process"
  }

  profile {
    name "Total Packing Coke Consumption"
    label :packing_quantity
    path "packingQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of packing coke consumed during the process"
  }

  profile {
    name "Total Pitch Comsumption"
    label :pitch_quantity
    path "pitchQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of pitch consumed during the process"
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

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "The methodology represents an alternative approach to calculating electrolysis process CO2 emissions based on the consumption of carbon containing materials. If quantities of purchased carbon containing materials aren't known, use the 'default' method."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}

calculation {

  name "Coke calcination"
  label :aluminium_coke_calcination
  path "/business/processes/production/aluminium/coke"

  drill {
    name "Type"
    label :type
    path "type"
    interface :drop_down
    hide!
  }

  profile {
    name "Calcined coke production"
    label :mass_calcined_coke_produced
    path "massCalcinedCokeProduced"
    optional!
    default_unit :t
    alternative_units :kg, :g, :oz, :lb, :Gg, :ton_us, :ton_uk
    unit :t
    type :decimal
    interface :text_box
    note "Specify the total quantity of calcined coke produced from green coke during the reporting period. If unknown, either a facility-specific or default value for the quantity of calcined coke produced per quantity of green coke can be used."
  }

  profile {
    name "Calcined coke production per mass feedstock"
    label :mass_calcined_coke_produced_per_mass
    path "massCalcinedCokeProducedPerMass"
    value "0.68"
    optional!
    default_unit :t
    default_per_unit :t
    alternative_units :kg, :g, :oz, :lb, :Gg, :ton_us, :ton_uk
    alternative_per_units :kg, :g, :oz, :lb, :Gg, :ton_us, :ton_uk
    unit :t
    per_unit :t
    type :decimal
    interface :text_box
    note "Specify the quantity of calcined coke produced per quantity of green coke consumed. If this is unknown, an industry typical value is used. If the quantity of calcined coke is explicitly specified, this value is ignored."
  }

  profile {
    name "Coke dust emissions"
    label :mass_coke_dust
    path "massCokeDust"
    optional!
    default_unit :t
    alternative_units :kg, :g, :oz, :lb, :Gg, :ton_us, :ton_uk
    unit :t
    type :decimal
    interface :text_box
    note "Specify the quantity of coke dust emitted during the calcining process. If unknown, either a facility-specific or default value for the quantity of coke dust produced per quantity of green coke can be used."
  }

  profile {
    name "Coke dust emissions per mass feedstock"
    label :mass_coke_dust_per_mass
    path "massCokeDustPerMass"
    value "0.075"
    optional!
    default_unit :t
    default_per_unit :t
    alternative_units :kg, :g, :oz, :lb, :Gg, :ton_us, :ton_uk
    alternative_per_units :kg, :g, :oz, :lb, :Gg, :ton_us, :ton_uk
    unit :t
    per_unit :t
    type :decimal
    interface :text_box
    note "Specify the quantity of coke dust produced per quantity of green coke consumed. If this is unknown, an industry typical value is used. If the quantity of coke dust recovered is explicitly specified, this value is ignored."
  }

  profile {
    name "Green coke feed"
    label :mass_green_coke
    path "massGreenCoke"
    default_unit :t
    alternative_units :kg, :g, :oz, :lb, :Gg, :ton_us, :ton_uk
    unit :t
    type :decimal
    interface :text_box
    note "Specify the quantity of green coke calcined during the reporting period"
  }

  profile {
    name "Green coke methane content"
    label :green_coke_methane_content
    path "greenCokeMethaneContent"
    value "0.035"
    optional!
    type :decimal
    interface :text_box
    note "Specify the methane content of green coke consumed, as a weight percentage (0-100). If unknown, an industry typical default value is used."
  }

  profile {
    name "Green coke moisture content"
    label :green_coke_moisture_content
    path "greenCokeMoistureContent"
    value "10.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the moisture content of green coke consumed, as a weight percentage (0-100). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Green coke sulphur content"
    label :green_coke_sulphur_content
    path "greenCokeSulphurContent"
    value "3.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the sulphur content of green coke consumed, as a weight percentage (0-100). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Green coke volatiles content"
    label :green_coke_volatiles_content
    path "greenCokeVolatilesContent"
    value "10.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the volatiles content of green coke consumed, as a weight percentage (0-100). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Sulphur content in calcined coke"
    label :calcined_coke_sulphur
    path "calcinedCokeSulphur"
    value "2.5"
    optional!
    type :decimal
    interface :text_box
    note "Specify the sulphur content of the calcined coke, as a weight percentage (0-100). If no value is specified, an industry typical default value is used"
  }

  profile {
    name "Under-calcined coke collected"
    label :under_calcined_coke_collected
    path "underCalcinedCokeCollected"
    value "0.0"
    optional!
    default_unit :t
    alternative_units :kg, :g, :oz, :lb, :Gg, :ton_us, :ton_uk
    unit :t
    type :decimal
    interface :text_box
    note "Specify the quantity of undercalcined coke recovered from the calcining process. If unspecified, this value is assumed to be 0."
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

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology can be used to calculate the CO2 emissions associated with the calcining of coke."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}

calculation {

  name "Soda ash consumption"
  label :aluminium_soda_ash
  path "/business/processes/production/aluminium/sodaAsh"

  drill {
    name "Type"
    label :type
    path "type"
    interface :drop_down
    hide!
  }

  profile {
    name "Fraction Calcination for Soda Ash"
    label :calc_frac
    path "calcFrac"
    value "1.0"
    optional!
    type :decimal
    interface :text_box
    note "Specify the fraction of calcination achieved, as a decimal fraction (0-1). If not specified, this value is assumed to be 1, i.e. that soda ash is completely calcined."
  }

  profile {
    name "Fraction Purity of Soda Ash"
    label :soda_frac
    path "sodaFrac"
    value "0.95"
    optional!
    type :decimal
    interface :text_box
    note "Specify the purity of soda ash, as a decimal fraction (0-1). If not specified, an industry typical value is used"
  }

  profile {
    name "Quantity of Soda Ash"
    label :soda_quantity
    path "sodaQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of soda ash consumed during the reporting period"
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

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology can be used to calculate the CO2 emissions associated with the consumption of soda ash."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}

calculation {

  name "Lime production"
  label :aluminium_lime_production
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
    value "This methodology can be used to calculate the CO2 emissions associated with the production of lime."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}

calculation {

  name "Default approach for electrolysis PFCs"
  label :aluminium_default_electrolysis_pfc
  path "/business/processes/production/aluminium/pfc/defaults"

  drill {
    name "Type of cell technology"
    label :cell_type
    path "cellType"
    interface :drop_down
    note "Select the type of electrolysis cell used during the reporting period."
  }

  profile {
    name "C2F6 emissions per unit production"
    label :c2f6_emis_fact
    path "c2f6EmisFact"
    optional!
    default_unit :kg
    default_per_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    per_unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of C2F6 emitted per quantity of aluminium produced. If not specified, an industry typical value is used."
  }

  profile {
    name "CF4 emissions per unit production"
    label :cf4_emis_fact
    path "cf4EmisFact"
    optional!
    default_unit :kg
    default_per_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    per_unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of C2F6 emitted per quantity of aluminium produced. If not specified, an industry typical value is used."
  }

  profile {
    name "Quantity of aluminium produced"
    label :al_quantity
    path "alQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of aluminium produced during the reporting period."
  }

  output {
    name "C2F6"
    label :c2_f6
    path "C2F6"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "C2F6 emissions calculated based on data (facility-specific and default) entered for each scenario."
  }

  output {
    name "CF4"
    label :cf4
    path "CF4"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CF4 emissions calculated based on data (facility-specific and default) entered for each scenario."
  }

  output {
    name "CO2e"
    label :co2e
    path "CO2e"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. These represent CF4 and C2F6 emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect."
  }

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Potline ID"
    label :potline_id
    path "potline_id"
    type :string
    interface :text_box
    note "Provide a reference for the potline for which data is being entered"
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology enables the calculation of electrolysis-associated CF4 and C2F6 emissions on the basis of emissions factors. It should be used only when anode effect process data is unavailable."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}

calculation {

  name "Slope approach for electrolysis PFCs"
  label :aluminium_slope_electrolysis_pfc
  path "/business/processes/production/aluminium/pfc/slope"

  drill {
    name "Type of cell technology"
    label :cell_type
    path "cellType"
    interface :drop_down
    note "Select the type of electrolysis cell used during the reporting period."
  }

  profile {
    name "Anode effect frequency"
    label :aef
    path "aef"
    optional!
    default_per_unit :day
    alternative_per_units :s, :h, :min, :month, :week, :year
    per_unit :day
    type :decimal
    interface :text_box
    note "Anode effect frequency. Optional. Ignored if none entered"
    hide!
  }

  profile {
    name "Anode effect minutes"
    label :aem
    path "aem"
    default_unit :min
    default_per_unit :day
    alternative_units :s, :h, :month, :week, :year, :day
    alternative_per_units :s, :h, :min, :month, :week, :year
    unit :min
    per_unit :day
    type :decimal
    interface :text_box
    note "Specify the average duration of anode effect for the reporting period."
  }

  profile {
    name "C2F6/CF4 weight fraction"
    label :weight_frac
    path "weightFrac"
    optional!
    type :decimal
    interface :text_box
    note "Specify the ratio of weights for CF4 and C2F6. If not specified, an industry typical value is used."
  }

  profile {
    name "Quantity of aluminium produced"
    label :al_quantity
    path "alQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of aluminium produced during the reporting period."
  }

  profile {
    name "Slope coefficient for CF4"
    label :cf4_coef
    path "cf4Coef"
    optional!
    default_unit :kg·day
    default_per_unit :t·min
    unit :kg·day
    per_unit :t·min
    type :decimal
    interface :text_box
    note "Specify the slope coefficient for CF4. If not specified, an industry typical value is used."
  }

  output {
    name "C2F6"
    label :c2_f6
    path "C2F6"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "C2F6 emissions calculated based on data (facility-specific and default) entered for each scenario."
  }

  output {
    name "CF4"
    label :cf4
    path "CF4"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CF4 emissions calculated based on data (facility-specific and default) entered for each scenario."
  }

  output {
    name "CO2e"
    label :co2e
    path "CO2e"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. These represent CF4 and C2F6 emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect."
  }

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Potline ID"
    label :potline_id
    path "potline_id"
    type :string
    interface :text_box
    note "Provide a reference for the potline for which data is being entered"
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology enables the calculation of electrolysis-associated CF4 and C2F6 emissions on the basis of the 'slope' method."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}

calculation {

  name "Overvoltage approach for electrolysis PFCs"
  label :aluminium_overvoltage_electrolysis_pfc
  path "/business/processes/production/aluminium/pfc/overvoltage"

  drill {
    name "Type of cell technology"
    label :cell_type
    path "cellType"
    interface :drop_down
    note "Select the type of electrolysis cell used during the reporting period."
  }

  profile {
    name "Anode offect overvoltage"
    label :aeo
    path "aeo"
    default_unit :mV
    alternative_units :V
    unit :mV
    type :decimal
    interface :text_box
    note "Specify the average anode effect overvoltage per cell for the reporting period."
  }

  profile {
    name "C2F6/CF4 weight fraction"
    label :weight_frac
    path "weightFrac"
    optional!
    type :decimal
    interface :text_box
    note "Specify the ratio of weights for CF4 and C2F6. If not specified, an industry typical value is used."
  }

  profile {
    name "Current efficiency (%)"
    label :cur_eff
    path "curEff"
    type :decimal
    interface :text_box
    note "Specify the current efficiency, as a percentage (0-100)."
  }

  profile {
    name "Overvoltage coefficient for CF4"
    label :ov_coef
    path "ovCoef"
    optional!
    default_unit :kg
    default_per_unit :t·mV
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    per_unit :t·mV
    type :decimal
    interface :text_box
    note "Specify the overvoltage coefficient for CF4. If not specified, an industry typical value is used."
  }

  profile {
    name "Quantity of aluminium produced"
    label :al_quantity
    path "alQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of aluminium produced during the reporting period."
  }

  output {
    name "C2F6"
    label :c2_f6
    path "C2F6"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "C2F6 emissions calculated based on data (facility-specific and default) entered for each scenario."
  }

  output {
    name "CF4"
    label :cf4
    path "CF4"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CF4 emissions calculated based on data (facility-specific and default) entered for each scenario."
  }

  output {
    name "CO2e"
    label :co2e
    path "CO2e"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. These represent CF4 and C2F6 emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect."
  }

  output {
    name "Comment"
    label :comment
    path "comment"
    hide!
  }

  metadatum {
    name "Potline ID"
    label :potline_id
    path "potline_id"
    type :string
    interface :text_box
    note "Provide a reference for the potline for which data is being entered"
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This methodology enables the calculation of electrolysis-associated CF4 and C2F6 emissions on the basis of the 'overvoltage' method."
    interface :drop_down
    hide!
  }

  metadatum {
    name "Reporting period"
    label :reporting_period
    path "reporting_period"
    type :string
    interface :text_box
    note "Provide a reference for the reporting period under consideration"
  }

}


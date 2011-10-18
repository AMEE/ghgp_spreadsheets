calculation {

  name "Direct N2O emissions from adipic acid production"
  label :adipic_acid
  path "/business/processes/production/adipicAcid"

  drill {
    name "Abatement Technology employed"
    label :abatement_technology
    path "abatementTechnology"
    interface :drop_down
    note "Select the type of abatement technology used during operation."
  }

  profile {
    name "Abatement technology destruction factor"
    label :destr_fact
    path "destrFact"
    optional!
    type :decimal
    interface :text_box
    note "Specify the efficiency (the fraction of emissions abated; 0-1) of the selected abatement technology."
  }

  profile {
    name "Abatement technology utilization factor"
    label :abate_fact
    path "abateFact"
    optional!
    type :decimal
    interface :text_box
    note "Specify the fraction of production (0-1) which employs abatement technologies (abatement utilization factor)."
  }

  profile {
    name "Baseline N2O emissions per unit of production"
    label :em_fact
    path "emFact"
    value "0.3"
    optional!
    default_unit :kg
    default_per_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    per_unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of N2O produced per unit of adipic acid produced."
  }

  profile {
    name "Quantity of Adipic Acid produced"
    label :adipic_quantity
    path "adipicQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of adipic acid produced."
  }

  output {
    name "CO2e"
    label :co2e
    path "CO2e"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "CO2e emissions calculated based on data (facility-specific and default) entered for each scenario. This represents N2O emissions expressed in terms of the quantity of CO2 which would exert the same atmospheric warming effect."
  }

  output {
    name "N2O"
    label :n2_o
    path "N2O"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    note "N2O emissions calculated based on data (facility-specific and default) entered for each scenario."
  }

  metadatum {
    name "Note"
    label :note
    path "note"
    value "This approach enables the calculation of direct N2O (and CO2e) emissions associated with adipic acid production. Calculations are differentiated by the type of abatement technology used (including no abatement)"
    interface :drop_down
    hide!
  }

}


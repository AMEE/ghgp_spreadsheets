calculation {

  name "N2O emissions based on nitric acid production"
  label :nitric_acid_production
  path "/business/processes/production/nitricAcid"

  drill {
    name "Type of plant"
    label :plant_type
    path "plantType"
    interface :drop_down
    note "Select the type of technology used at the plant."
  }

  profile {
    name "Abatement System Utilization Factor"
    label :abate_fact
    path "abateFact"
    optional!
    type :decimal
    interface :text_box
    note "Specify the fraction of production (0-1) which employs abatement technologies (abatement utilization factor)."
  }

  profile {
    name "Destruction Factor"
    label :destr_fact
    path "destrFact"
    optional!
    type :decimal
    interface :text_box
    note "Specify the efficiency (the fraction of emissions abated; 0-1) of abatement technologies."
  }

  profile {
    name "Emissions Factor"
    label :spec_em_fact
    path "specEmFact"
    optional!
    default_unit :kg
    default_per_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    alternative_per_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    per_unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of N2O produced per unit of nitric acid produced."
  }

  profile {
    name "Quantity of Nitric Acid"
    label :acid_quantity
    path "acidQuantity"
    default_unit :kg
    alternative_units :g, :oz, :lb, :t, :Mg, :Gg, :ton_us, :ton_uk
    unit :kg
    type :decimal
    interface :text_box
    note "Specify the quantity of nitric acid produced."
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
    value "This approach enables the calculation of N2O (and CO2e) emissions associated with nitric acid production based on the quantity of nitric acid produced"
    interface :drop_down
    hide!
  }

}


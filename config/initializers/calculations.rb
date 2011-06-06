Calculations=
  AMEE::DataAbstraction::CalculationSet.new {
  all_calculations {
    #metadatum {
    #  label :department
    #  choices %w{stuff things more_stuff meta_things}
    #}
    #organisational_metadata
    #start_and_end_dates

    #Correct titles for outputs
    correcting(:co2) { name "Carbon Dioxide"}
    correcting(:ch4) { name "Methane"}
    correcting(:n2_o) { name "Nitrous Oxide"}
    correcting(:co2e) { name "Equivalent Carbon Dioxide"}
  }

  calculation {
    name 'Default methodology'
    label :default
    path '/business/processes/production/aluminium/defaults'
    terms_from_amee 'default'
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
  }
  calculation {
    name 'Soderberg methodology'
    label :soderberg
    path '/business/processes/production/aluminium/soderberg'
    terms_from_amee 'default'
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
  }
  calculation {
    name 'Prebake methodology'
    label :prebake
    path '/business/processes/production/aluminium/prebake/electrolysis'
    terms_from_amee 'default'
    correcting(:type) { hide! }
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
  }
  calculation {
    name 'Pitchcooking with default waste tar methodology'
    label :pitchcook_default_tar
    path '/business/processes/production/aluminium/prebake/pitchcooking'
    terms_from_amee 'defaultWasteTarQuantity'
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
  }
  calculation {
    name 'Pitchcooking with default anode weight methodology'
    label :pitchcook_default_anode
    path '/business/processes/production/aluminium/prebake/pitchcooking'
    terms_from_amee 'defaultAnodeWeight'
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
  }
}

Calculations=AMEE::DataAbstraction::CalculationSet.new {
  all_calculations {
    metadatum {
      label :department
      choices %w{stuff things more_stuff meta_things}
    }
    start_and_end_dates
  }

  calculation{
    name 'electricity'
    label :electricity
    path '/business/energy/electricity/grid' 
    drill {
      label :country
      path 'country'
      fixed 'Argentina'
    }
    profile {
      label :usage
      name 'Electricity Used'
      path 'energyPerTime'
    }
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
  }
  
  calculation {
    name 'transport'
    label :transport
    path '/transport/car/generic'
  
    all_drills
    usage {value 'byDistance'}
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
  }

  calculations_all_usages('/business/energy/stationaryCombustion/epa/coal') {|usage|
    label "coal_#{usage.underscore}".to_sym
    terms_from_amee usage
  }

  calculation {
    name 'Coal'
    label :coal
    path '/business/energy/stationaryCombustion/epa/coal'
    terms_from_amee_dynamic_usage 'byMass'
  }
}
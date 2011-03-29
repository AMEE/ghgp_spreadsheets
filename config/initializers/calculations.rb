Calculations=AMEE::DataAbstraction::CalculationSet.new {
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

  calculation {
    name 'Coal'
    label :coal
    path '/business/energy/stationaryCombustion/epa/coal'
    terms_from_amee_dynamic_usage 'byMass'
  }
}

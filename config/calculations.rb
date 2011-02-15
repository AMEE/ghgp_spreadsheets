Calculations=CalculationSet.new {
  calculation{
    name 'electricity'
    label :electricity
    path '/business/energy/electricity/grid'
    profile {
      label :usage
      name 'Electricity Used'
      path 'energyPerTime'
    }
    drill {
      label :country
      path 'country'
      value 'Argentina'
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
  
    drill {
      path 'fuel'
      label :fuel
      name 'Fuel type'
    }
    drill {
      path 'size'
      label :size
      name 'Vehicle size'
    }
    profile {
      path 'distance'
      label :distance
      name 'Distance Driven'
    }
    output {
      label :co2
      name 'Carbon Dioxide'
      path :default
    }
  }
}

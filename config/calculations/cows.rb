calculation {
  label :cow_gas
  name "Cow Gas"
  path "/transport/ghgp/passenger"
  all_drills
  all_profiles
  output {
    label :ch4
    name 'Methane'
    path 'CH4'
    type :float
  }
  output {
    label :co2e
    name 'CO2 equivalent'
    path 'CO2e'
    type :float
  }
}
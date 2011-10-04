[
  'adipic',
  'aluminium',
  'ammonia',
  'hcfc22',
  'iron_and_steel',
  'lime',
  'nitric'
].each do |x|
  if ENV['GHGP_TYPE'] == x
    require "calculations/#{x}.rb"
  end
end
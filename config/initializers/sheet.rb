$sheet = ENV['SHEET_TYPE']

$sheet_types = {
  'adipic' => 'the Adipic Acid Sector',
  'aluminium' => 'the Aluminium Sector',
  'ammonia' => 'the Ammonia Sector',
  'hcfc22' => 'the HCFC-22 Sector',
  'iron_and_steel' => 'the Iron and Steel Sector',
  'lime' => 'the Lime Sector',
  'nitric' => 'the Nitric Acid Sector',
  'stationary_combustion' => 'Stationary Combustion'
}
$tool_name = $sheet_types[$sheet]
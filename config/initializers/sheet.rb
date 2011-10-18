$sheet = ENV['SHEET_TYPE']

$sheet_types = {
  'adipic' => 'Adipic Acid Sector',
  'aluminium' => 'Aluminium Sector',
  'ammonia' => 'Ammonia Sector',
  'hcfc22' => 'HCFC-22 Sector',
  'iron_and_steel' => 'Iron and Steel Sector',
  'lime' => 'Lime Sector',
  'nitric' => 'Nitric Acid Sector',
}
$tool_name = $sheet_types[$sheet]
# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

$sheet = ENV['SHEET_TYPE']

$sheet_types = {
  'adipic' => 'the Adipic Acid Sector',
  'aluminium' => 'the Aluminium Sector',
  'ammonia' => 'the Ammonia Sector',
  'hcfc22' => 'the HCFC-22 Sector',
  'iron_and_steel' => 'the Iron and Steel Sector',
  'lime' => 'the Lime Sector',
  'nitric' => 'the Nitric Acid Sector',
  'stationary_combustion' => 'Stationary Combustion',
  'transport' => 'Transport'
}
$tool_name = $sheet_types[$sheet]
$sheet_types.each_pair do |key, title|
  if ENV['SHEET_TYPE'] == key
    require "calculations/#{x}.rb"
  end
end
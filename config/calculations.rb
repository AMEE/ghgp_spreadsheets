$sheet_types.each_pair do |key, title|
  if ENV['SHEET_TYPE'] == key
    require "#{Rails.root}/config/calculations/#{key}.rb"
  end
end
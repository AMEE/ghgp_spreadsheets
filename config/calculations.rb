$sheet_types.each_pair do |key, title|
  if ENV['SHEET_TYPE'] == key
    config_path = "#{Rails.root}/config/calculations/"
    config_file = config_path + "#{key}.rb"
    locked_config_file = config_path + "#{key}.lock.rb"
    require (File.exists?(locked_config_file) ? locked_config_file : config_file)
  end
end
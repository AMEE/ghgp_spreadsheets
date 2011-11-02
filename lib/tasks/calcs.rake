namespace :calcs do

  namespace :config do

    # Performs application setup
    desc 'Regenerates a lock file for a specified calculations config file. Run as: rake "calcs:config:lock[<file>]"'
    task :lock, [:file] => [:environment] do |t, args|
      AMEE::DataAbstraction::CalculationSet.regenerate_lock_file(args[:file])
    end

    # Performs application setup
    desc 'Regenerates all locks files. Run as: rake "calcs:config:lock_all"'
    task :lock_all => [:environment] do |t, args|
      $sheet_types.each_key do |key|
        puts key
        AMEE::DataAbstraction::CalculationSet.regenerate_lock_file(key.to_s)
      end
    end

  end

end
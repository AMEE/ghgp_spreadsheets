namespace :calcs do

  namespace :config do

    # Performs application setup
    desc 'Regenerates a lock file for a specified calculations config file. Run as: rake "calcs:config:lock[<file>]"'
    task :lock, [:file] => [:environment] do |t, args|
      # Get commandline options
      AMEE::DataAbstraction::CalculationSet.regenerate_lock_file(args[:file])
    end

  end

end
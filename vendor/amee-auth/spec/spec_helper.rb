# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

require 'rubygems'
require 'rspec'
require 'rails'
require 'action_controller'
require 'amee-auth'
require 'database_cleaner'

# Migrate test database to have Users table
DB_CONFIG = YAML.load_file(File.dirname(__FILE__) + '/database.yml')
DB_MIGRATION = File.join(File.dirname(__FILE__), '..','lib','generators','amee_auth','templates','db','migrate','create_users.rb.erb')

Dir::mkdir("tmp") unless File.directory?("tmp")
File.open("tmp/001_create_users_migration.rb", "w"){|f| f.write(File.read(DB_MIGRATION).gsub("<%= migration_name %>", "CreateUsersMigration"))}

ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'a'))
ActiveRecord::Base.establish_connection(DB_CONFIG)
ActiveRecord::Migrator.up(File.join(File.dirname(__FILE__), "..", "tmp"))

File.unlink(File.join(File.dirname(__FILE__), "..", "tmp", "001_create_users_migration.rb"))

# Use Database Cleaner to clear out data between tests
RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

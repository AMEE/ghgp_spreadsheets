# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

require 'rails/generators/migration'
require 'rails/generators/active_record'

class AmeeAuthGenerator < Rails::Generators::Base
  
  include Rails::Generators::Migration

  desc "Generates a migration for the AMEE Organisation models"
  def self.source_root
    @source_root ||= File.dirname(__FILE__) + '/templates'
  end

  def self.next_migration_number(path)
    ActiveRecord::Generators::Base.next_migration_number(path)
  end

  def generate_migration
    migration_template 'db/migrate/create_users.rb', 'db/migrate/create_users'
  end
end
class ConfigController < ApplicationController
  def show
    @config=File.read("#{RAILS_ROOT}/config/initializers/calculations.rb")
  end
  
end

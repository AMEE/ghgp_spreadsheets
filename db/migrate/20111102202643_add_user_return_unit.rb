class AddUserReturnUnit < ActiveRecord::Migration
  def self.up
    add_column :users, :return_unit, :string, :null => false, :default => 'kg'
  end

  def self.down
    remove_column :users, :return_unit
  end
end

class CreateOrganisationTables < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string  "name"
      t.references :parent
      t.references :aspect
      t.references :layer
    end

    create_table :aspects do |t|
      t.string  "name"
    end

    create_table :components do |t|
      t.string  "name"
    end

    create_table :components_sections,:id=>false do |t|
      t.references :section
      t.references :component
    end

    create_table :layers do |t|
      t.string "name"
      t.references :aspect
    end

  end

  def self.down
    drop_table :sections
    drop_table :aspects
    drop_table :components
    drop_table :components_sections
    drop_table :layers
  end
end

# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110504091608) do

  create_table "aspects", :force => true do |t|
    t.string "name"
  end

  create_table "calculations", :force => true do |t|
    t.string   "profile_uid"
    t.string   "profile_item_uid"
    t.string   "calculation_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components", :force => true do |t|
    t.string "name"
  end

  create_table "components_sections", :id => false, :force => true do |t|
    t.integer "section_id"
    t.integer "component_id"
  end

  create_table "layers", :force => true do |t|
    t.string  "name"
    t.integer "aspect_id"
  end

  create_table "sections", :force => true do |t|
    t.string  "name"
    t.integer "parent_id"
    t.integer "aspect_id"
    t.integer "layer_id"
  end

  create_table "terms", :force => true do |t|
    t.integer  "calculation_id"
    t.string   "label"
    t.string   "value"
    t.string   "unit"
    t.string   "per_unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

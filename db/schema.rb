# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130124192559) do

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "character_class"
    t.integer  "race"
    t.integer  "gender"
    t.integer  "level"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "characters_data", :force => true do |t|
    t.string   "race_name"
    t.string   "side"
    t.string   "class_name"
    t.integer  "race_id"
    t.integer  "class_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "equipment", :force => true do |t|
    t.string   "head"
    t.string   "neck"
    t.string   "shoulder"
    t.string   "back"
    t.string   "chest"
    t.string   "wrist"
    t.string   "hands"
    t.string   "waist"
    t.string   "legs"
    t.string   "feet"
    t.string   "finger_1"
    t.string   "finger_2"
    t.string   "trinket_1"
    t.string   "trinlet_2"
    t.string   "main_hand"
    t.string   "range_weapon"
    t.string   "name"
    t.integer  "equipment_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "realms", :force => true do |t|
    t.string   "name"
    t.integer  "character_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "realms", ["character_id"], :name => "index_realms_on_character_id"
  add_index "realms", ["user_id"], :name => "index_realms_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "user_name"
    t.string   "character_name"
    t.string   "string"
    t.string   "realm"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end

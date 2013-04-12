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

ActiveRecord::Schema.define(:version => 20130411061746) do

  create_table "character_equips", :force => true do |t|
    t.integer  "character_id"
    t.integer  "equipment_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

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

  create_table "equipments", :force => true do |t|
    t.string   "equip_icon"
    t.string   "equip_quality"
    t.integer  "equip_itemlvl"
    t.string   "equip_stat"
    t.string   "equip_part"
    t.string   "equip_name"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "equip_num"
    t.integer  "equip_counts",  :default => 0
    t.string   "equip_class"
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

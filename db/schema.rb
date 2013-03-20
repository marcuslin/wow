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

ActiveRecord::Schema.define(:version => 20130320104043) do

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

  create_table "equipment", :force => true do |t|
    t.string   "head"
    t.string   "head_icon"
    t.string   "head_quality"
    t.integer  "head_itemlvl"
    t.string   "head_stat"
    t.string   "neck"
    t.string   "neck_icon"
    t.string   "neck_quality"
    t.integer  "neck_itemlvl"
    t.string   "neck_stat"
    t.string   "shoulder"
    t.string   "shoulder_icon"
    t.string   "shoulder_quality"
    t.integer  "shoulder_itemlvl"
    t.string   "shoulder_stat"
    t.string   "back"
    t.string   "back_icon"
    t.string   "back_quality"
    t.integer  "back_itemlvl"
    t.string   "back_stat"
    t.string   "chest"
    t.string   "chest_icon"
    t.string   "chest_quality"
    t.integer  "chest_itemlvl"
    t.string   "chest_stat"
    t.string   "wrist"
    t.string   "wrist_icon"
    t.string   "wrist_quality"
    t.integer  "wrist_itemlvl"
    t.string   "wrist_stat"
    t.string   "hands"
    t.string   "hands_icon"
    t.string   "hands_quality"
    t.integer  "hands_itemlvl"
    t.string   "hands_stat"
    t.string   "waist"
    t.string   "waist_icon"
    t.string   "waist_quality"
    t.integer  "waist_itemlvl"
    t.string   "waist_stat"
    t.string   "legs"
    t.string   "legs_icon"
    t.string   "legs_quality"
    t.integer  "legs_itemlvl"
    t.string   "legs_stat"
    t.string   "feet"
    t.string   "feet_icon"
    t.string   "feet_quality"
    t.integer  "feet_itemlvl"
    t.string   "feet_stat"
    t.string   "finger_1"
    t.string   "finger_1_icon"
    t.string   "finger_1_quality"
    t.integer  "finger_1_itemlvl"
    t.string   "finger_1_stat"
    t.string   "finger_2"
    t.string   "finger_2_icon"
    t.string   "finger_2_quality"
    t.integer  "finger_2_itemlvl"
    t.string   "finger_2_stat"
    t.string   "trinket_1"
    t.string   "trinket_1_icon"
    t.string   "trinket_1_quality"
    t.integer  "trinket_1_itemlvl"
    t.string   "trinket_1_stat"
    t.string   "trinket_2"
    t.string   "trinket_2_icon"
    t.string   "trinket_2_quality"
    t.integer  "trinket_2_itemlvl"
    t.string   "trinket_2_stat"
    t.string   "main_hand"
    t.string   "main_hand_icon"
    t.string   "main_hand_quality"
    t.integer  "main_hand_itemlvl"
    t.string   "main_hand_stat"
    t.string   "off_hand"
    t.string   "off_hand_icon"
    t.string   "off_hand_quality"
    t.integer  "off_hand_itemlvl"
    t.string   "off_hand_stat"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "character_id"
    t.integer  "head_num"
    t.integer  "neck_num"
    t.integer  "shoulder_num"
    t.integer  "back_num"
    t.integer  "chest_num"
    t.integer  "wrist_num"
    t.integer  "hands_num"
    t.integer  "waist_num"
    t.integer  "legs_num"
    t.integer  "feet_num"
    t.integer  "finger_1_num"
    t.integer  "finger_2_num"
    t.integer  "trinket_1_num"
    t.integer  "trinket_2_num"
    t.integer  "main_hand_num"
    t.integer  "off_hand_num"
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

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

ActiveRecord::Schema.define(:version => 20130215131843) do

  create_table "character_equip", :force => true do |t|
    t.integer  "character_id_id"
    t.integer  "equipment_id_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
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
    t.string   "head"
    t.string   "head_icon"
    t.string   "head_quality"
    t.integer  "head_itemlvl"
    t.integer  "head_stat"
    t.integer  "head_stat_amount"
    t.string   "neck"
    t.string   "neck_icon"
    t.string   "neck_quality"
    t.integer  "neck_itemlvl"
    t.integer  "neck_stat"
    t.integer  "neck_stat_amount"
    t.string   "shoulder"
    t.string   "shoulder_icon"
    t.string   "shoulder_quality"
    t.integer  "shoulder_itemlvl"
    t.integer  "shoulder_stat"
    t.integer  "shoulder_stat_amount"
    t.string   "back"
    t.string   "back_icon"
    t.string   "back_quality"
    t.integer  "back_itemlvl"
    t.integer  "back_stat"
    t.integer  "back_stat_amount"
    t.string   "chest"
    t.string   "chest_icon"
    t.string   "chest_quality"
    t.integer  "chest_itemlvl"
    t.integer  "chest_stat"
    t.integer  "chest_stat_amount"
    t.string   "wrist"
    t.string   "wrist_icon"
    t.string   "wrist_quality"
    t.integer  "wrist_itemlvl"
    t.integer  "wrist_stat"
    t.integer  "wrist_stat_amount"
    t.string   "hands"
    t.string   "hands_icon"
    t.string   "hands_quality"
    t.integer  "hands_itemlvl"
    t.integer  "hands_stat"
    t.integer  "hands_stat_amount"
    t.string   "waist"
    t.string   "waist_icon"
    t.string   "waist_quality"
    t.integer  "waist_itemlvl"
    t.integer  "waist_stat"
    t.integer  "waist_stat_amount"
    t.string   "legs"
    t.string   "legs_icon"
    t.string   "legs_quality"
    t.integer  "legs_itemlvl"
    t.integer  "legs_stat"
    t.integer  "legs_stat_amount"
    t.string   "feet"
    t.string   "feet_icon"
    t.string   "feet_quality"
    t.integer  "feet_itemlvl"
    t.integer  "feet_stat"
    t.integer  "feet_stat_amount"
    t.string   "finger_1"
    t.string   "finger_1_icon"
    t.string   "finger_1_quality"
    t.integer  "finger_1_itemlvl"
    t.integer  "finger_1_stat"
    t.integer  "finger_1_stat_amount"
    t.string   "finger_2"
    t.string   "finger_2_icon"
    t.string   "finger_2_quality"
    t.integer  "finger_2_itemlvl"
    t.integer  "finger_2_stat"
    t.integer  "finger_2_stat_amount"
    t.string   "trinket_1"
    t.string   "trinket_1_icon"
    t.string   "trinket_1_quality"
    t.integer  "trinket_itemlvl"
    t.integer  "trinket_1_stat"
    t.integer  "trinket_1_stat_amount"
    t.string   "trinket_2"
    t.string   "trinket_2_icon"
    t.string   "trinket_2_quality"
    t.integer  "trinket_2_itemlvl"
    t.integer  "trinket_2_stat"
    t.integer  "trinket_2_stat_amount"
    t.string   "main_hand"
    t.string   "main_hand_icon"
    t.string   "main_hand_quality"
    t.integer  "main_hand_itemlvl"
    t.integer  "main_hand_stat"
    t.integer  "main_hand_stat_amount"
    t.string   "off_hand"
    t.string   "off_hand_icon"
    t.string   "off_hand_quality"
    t.integer  "off_hand_itemlvl"
    t.integer  "off_hand_stat"
    t.integer  "off_hand_stat_amount"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
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
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end

class AddNumColumnToEquipments < ActiveRecord::Migration
  def change
    add_column :equipments, :head_num, :integer
    add_column :equipments, :neck_num, :integer
    add_column :equipments, :shoulder_num, :integer
    add_column :equipments, :back_num, :integer
    add_column :equipments, :chest_num, :integer
    add_column :equipments, :wrist_num, :integer
    add_column :equipments, :hands_num, :integer
    add_column :equipments, :waist_num, :integer
    add_column :equipments, :legs_num, :integer
    add_column :equipments, :feet_num, :integer
    add_column :equipments, :finger_1_num, :integer
    add_column :equipments, :finger_2_num, :integer
    add_column :equipments, :trinket_1_num, :integer
    add_column :equipments, :trinket_2_num, :integer
    add_column :equipments, :main_hand_num, :integer
    add_column :equipments, :off_hand_num, :integer
  end
end

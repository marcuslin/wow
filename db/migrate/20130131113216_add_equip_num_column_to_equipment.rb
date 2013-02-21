class AddEquipNumColumnToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :head_num, :integer
    add_column :equipment, :neck_num, :integer
    add_column :equipment, :shoulder_num, :integer
    add_column :equipment, :back_num, :integer
    add_column :equipment, :chest_num, :integer
    add_column :equipment, :wrist_num, :integer
    add_column :equipment, :hands_num, :integer
    add_column :equipment, :waist_num, :integer
    add_column :equipment, :legs_num, :integer
    add_column :equipment, :feet_num, :integer
    add_column :equipment, :finger_1_num, :integer
    add_column :equipment, :finger_2_num, :integer
    add_column :equipment, :trinket_1_num, :integer
    add_column :equipment, :trinlet_2_num, :integer
    add_column :equipment,  :main_hand_num, :integer
    add_column :equipment,  :off_hand_num, :integer
  end
end

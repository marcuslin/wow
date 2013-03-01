class RemoveStatAmount < ActiveRecord::Migration
  def change
    remove_column :equipment, :head_stat_amount
    remove_column :equipment, :neck_stat_amount
    remove_column :equipment, :shoulder_stat_amount
    remove_column :equipment, :back_stat_amount
    remove_column :equipment, :chest_stat_amount
    remove_column :equipment, :wrist_stat_amount
    remove_column :equipment, :hands_stat_amount
    remove_column :equipment, :waist_stat_amount
    remove_column :equipment, :legs_stat_amount
    remove_column :equipment, :feet_stat_amount
    remove_column :equipment, :finger_1_stat_amount
    remove_column :equipment, :finger_2_stat_amount
    remove_column :equipment, :trinket_1_stat_amount
    remove_column :equipment, :trinket_2_stat_amount
    remove_column :equipment, :main_hand_stat_amount
    remove_column :equipment, :off_hand_stat_amount
  end
end

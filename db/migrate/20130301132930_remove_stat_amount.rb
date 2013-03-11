class RemoveStatAmount < ActiveRecord::Migration
  def change
    remove_column :equipments, :head_stat_amount
    remove_column :equipments, :neck_stat_amount
    remove_column :equipments, :shoulder_stat_amount
    remove_column :equipments, :back_stat_amount
    remove_column :equipments, :chest_stat_amount
    remove_column :equipments, :wrist_stat_amount
    remove_column :equipments, :hands_stat_amount
    remove_column :equipments, :waist_stat_amount
    remove_column :equipments, :legs_stat_amount
    remove_column :equipments, :feet_stat_amount
    remove_column :equipments, :finger_1_stat_amount
    remove_column :equipments, :finger_2_stat_amount
    remove_column :equipments, :trinket_1_stat_amount
    remove_column :equipments, :trinket_2_stat_amount
    remove_column :equipments, :main_hand_stat_amount
    remove_column :equipments, :off_hand_stat_amount
  end
end

class ChangeEveryStatColumn < ActiveRecord::Migration
  def change
    change_column :equipment, :neck_stat, :string
    change_column :equipment, :shoulder_stat, :string
    change_column :equipment, :back_stat, :string
    change_column :equipment, :chest_stat, :string
    change_column :equipment, :wrist_stat, :string
    change_column :equipment, :hands_stat, :string
    change_column :equipment, :waist_stat, :string
    change_column :equipment, :legs_stat, :string
    change_column :equipment, :feet_stat, :string
    change_column :equipment, :finger_1_stat, :string
    change_column :equipment, :finger_2_stat, :string
    change_column :equipment, :trinket_1_stat, :string
    change_column :equipment, :trinket_2_stat, :string
    change_column :equipment, :main_hand_stat, :string
    change_column :equipment, :off_hand_stat, :string
  end
end

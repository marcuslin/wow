class ChangeEveryStatColumn < ActiveRecord::Migration
  def change
    change_column :equipments, :neck_stat, :string
    change_column :equipments, :shoulder_stat, :string
    change_column :equipments, :back_stat, :string
    change_column :equipments, :chest_stat, :string
    change_column :equipments, :wrist_stat, :string
    change_column :equipments, :hands_stat, :string
    change_column :equipments, :waist_stat, :string
    change_column :equipments, :legs_stat, :string
    change_column :equipments, :feet_stat, :string
    change_column :equipments, :finger_1_stat, :string
    change_column :equipments, :finger_2_stat, :string
    change_column :equipments, :trinket_1_stat, :string
    change_column :equipments, :trinket_2_stat, :string
    change_column :equipments, :main_hand_stat, :string
    change_column :equipments, :off_hand_stat, :string
  end
end

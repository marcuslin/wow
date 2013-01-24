class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :head
      t.string :neck
      t.string :shoulder
      t.string :back
      t.string :chest
      t.string :wrist
      t.string :hands
      t.string :waist
      t.string :legs
      t.string :feet
      t.string :finger_1
      t.string :finger_2
      t.string :trinket_1
      t.string :trinlet_2
      t.string :main_hand
      t.string :range_weapon
      t.string :name
      t.integer :equipment_id

      t.timestamps
    end
  end
end

class RemoveRangeAddOffChengeEqid < ActiveRecord::Migration
  def change
    remove_column :equipment, :range_weapon
    add_column :equipment, :off_hand, :string
    rename_column :equipment, :equipment_id, :equipment_numb
  end
end

class RenameEquipments < ActiveRecord::Migration
  def change
    rename_table :equipments, :equipment
  end
end

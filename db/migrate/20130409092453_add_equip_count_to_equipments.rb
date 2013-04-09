class AddEquipCountToEquipments < ActiveRecord::Migration
  def change
    add_column :equipments, :equip_counts, :integer, :default => 0
  end
end

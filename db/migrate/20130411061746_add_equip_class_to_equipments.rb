class AddEquipClassToEquipments < ActiveRecord::Migration
  def change
    add_column :equipments, :equip_class, :string
  end
end

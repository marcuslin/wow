class RemoveEquipmentTable < ActiveRecord::Migration
  def change
    drop_table :equipment
  end
end

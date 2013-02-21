class CreateEquipmentsTable < ActiveRecord::Migration
  def change
    create_table :equipments do |t|
      t.integer :equipment_num
      t.string :icon
    end
  end
end

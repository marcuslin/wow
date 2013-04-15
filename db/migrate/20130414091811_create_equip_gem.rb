class CreateEquipGem < ActiveRecord::Migration
  def change
    create_table :equip_gem do |t|
      t.references :gem
      t.references :equipment

      t.timestamps
    end
  end
end

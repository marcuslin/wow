class CreateEnchantTable < ActiveRecord::Migration
  def change
    create_table :enchants do |t|
      t.string :enchant_num
      t.string :enchant_name
      t.string :enchant_icon

      t.timestamps
    end
  end
end

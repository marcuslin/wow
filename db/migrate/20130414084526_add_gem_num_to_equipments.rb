class AddGemNumToEquipments < ActiveRecord::Migration
  def change
    add_column :equipments, :gem_num, :string
  end
end

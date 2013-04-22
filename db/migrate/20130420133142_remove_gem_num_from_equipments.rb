class RemoveGemNumFromEquipments < ActiveRecord::Migration
  def change
    remove_column :equipments, :gem0_num
    remove_column :equipments, :gem1_num
  end
end

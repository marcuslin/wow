class RenameGemColumnFromEquipment < ActiveRecord::Migration
  def change
    rename_column :equipments, :gem_num, :gem0
    add_column :equipments, :gem1, :string
  end
end

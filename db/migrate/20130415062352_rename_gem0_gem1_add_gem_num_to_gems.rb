class RenameGem0Gem1AddGemNumToGems < ActiveRecord::Migration
  def change
    add_column :gems, :gem_num, :string
    rename_column :equipments, :gem0, :gem0_num
    rename_column :equipments, :gem1, :gem1_num
  end
end

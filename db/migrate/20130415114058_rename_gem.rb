class RenameGem < ActiveRecord::Migration
  def change
    rename_table :gem, :gems
  end
end

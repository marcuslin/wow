class RenameGemTable < ActiveRecord::Migration
  def change
    rename_table :gems, :gem
  end
end

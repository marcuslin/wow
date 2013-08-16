class ChangeCharaterClassToInteger < ActiveRecord::Migration
  def change
    change_column :characters, :character_class, :integer
  end
end

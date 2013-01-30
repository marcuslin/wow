class AddCharacterIdColumnToEauipment < ActiveRecord::Migration
  def change
    add_column :equipment, :character_id, :integer
  end
end

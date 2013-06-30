class AddRealmColumnToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :realm, :string
  end
end

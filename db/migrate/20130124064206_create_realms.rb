class CreateRealms < ActiveRecord::Migration
  def change
    create_table :realms do |t|
      t.string :name
      t.references :character
      t.references :user

      t.timestamps
    end
    add_index :realms, :user_id
    add_index :realms, :character_id
  end
end

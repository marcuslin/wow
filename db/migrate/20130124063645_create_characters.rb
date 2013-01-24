class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :character_class
      t.integer :race
      t.integer :gender
      t.integer :level

      t.timestamps
    end
  end
end

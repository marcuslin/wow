class CreateCharactersData < ActiveRecord::Migration
  def change
    create_table :characters_data do |t|
      t.string :race_name
      t.string :side
      t.string :class_name
      t.integer :race_id
      t.integer :class_id

      t.timestamps
    end
  end
end

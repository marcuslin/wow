class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :character_name
      t.string :string
      t.string :realm

      t.timestamps
    end
  end
end

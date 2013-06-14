class DelUnnecessaryColumnInUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :string
    remove_column :users, :character_name
    remove_column :users, :realm
  end
end

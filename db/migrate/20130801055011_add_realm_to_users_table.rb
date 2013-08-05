class AddRealmToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :realms, :string
  end
end

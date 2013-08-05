class RemoveRealmToUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :realms
  end
end

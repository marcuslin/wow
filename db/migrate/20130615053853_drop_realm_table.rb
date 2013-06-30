class DropRealmTable < ActiveRecord::Migration
  def change
    drop_table :realms
  end
end

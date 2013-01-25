class RemoveString < ActiveRecord::Migration
  def change
    remove_column :characters, :string
  end
end

class ChangeStatColumn < ActiveRecord::Migration
  def change
    change_column :equipment, :head_stat, :string
  end
end

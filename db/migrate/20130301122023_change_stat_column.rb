class ChangeStatColumn < ActiveRecord::Migration
  def change
    change_column :equipments, :head_stat, :string
  end
end

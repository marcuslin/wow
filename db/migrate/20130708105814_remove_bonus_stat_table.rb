class RemoveBonusStatTable < ActiveRecord::Migration
  def change
    drop_table :bonus_stat
  end
end

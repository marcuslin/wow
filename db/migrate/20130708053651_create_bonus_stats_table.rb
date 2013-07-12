class CreateBonusStatsTable < ActiveRecord::Migration
  def change
    create_table :bonus_stat do |t|
      t.string :stats_num
      t.string :stats_info

      t.timestamps
    end
  end
end

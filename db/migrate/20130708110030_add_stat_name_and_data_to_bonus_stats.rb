class AddStatNameAndDataToBonusStats < ActiveRecord::Migration
  def change
    add_column :bonus_stats, :stats_num, :string
    add_column :bonus_stats, :stats_info, :string
  end
end

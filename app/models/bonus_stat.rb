class BonusStat < ActiveRecord::Base
  attr_accessible :stats_num, :stats_info

  def self.by_stats_num(stats_num)
      where(stats_num: stats_num).first.try('stats_info')
  end
end

class BonusStat < ActiveRecord::Base
  attr_accessible :stats_num, :stats_info

  def self.by_stats_num(stats_num)
      where(stats_num: stats_num.to_s).first.try('stats_info')
  end
end

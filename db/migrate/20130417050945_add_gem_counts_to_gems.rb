class AddGemCountsToGems < ActiveRecord::Migration
  def change
    add_column :gems, :gem_counts, :integer, :default => 0
  end
end

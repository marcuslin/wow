class CreateBonusStats < ActiveRecord::Migration
  def change
    create_table :bonus_stats do |t|

      t.timestamps
    end
  end
end

class AddTimestampToJewels < ActiveRecord::Migration
  def change
    add_column :jewels, :created_at, :datetime
    add_column :jewels, :updated_at, :datetime
  end
end

class CreateGemTable < ActiveRecord::Migration
  def change
    create_table :gems do |t|
      t.string :gem_name
      t.string :gem_icon
      t.string :gem_data
      t.string :gem_type
    end
  end
end

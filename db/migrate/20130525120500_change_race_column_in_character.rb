class ChangeRaceColumnInCharacter < ActiveRecord::Migration
  def up
    change_table :characters do |t|
      t.change :race, :string
    end
  end
end

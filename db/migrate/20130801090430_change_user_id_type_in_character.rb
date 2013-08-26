class ChangeUserIdTypeInCharacter < ActiveRecord::Migration
  def change
    # change_column :characters, :user_id, :integer
    connection.execute(%q{
    ALTER TABLE characters
    ALTER COLUMN user_id TYPE bigint USING user_id::bigint
    })
  end
end

class RenameGemsTable < ActiveRecord::Migration
  def change
    rename_table :gems, :jewels
  end
end

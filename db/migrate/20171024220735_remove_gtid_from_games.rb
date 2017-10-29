class RemoveGtidFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :gtid, :integer
    add_column :games, :gametype_id, :integer 
  end
end

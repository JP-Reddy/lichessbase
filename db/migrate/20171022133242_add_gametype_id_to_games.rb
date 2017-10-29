class AddGametypeIdToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :gtid, :integer
  end
end

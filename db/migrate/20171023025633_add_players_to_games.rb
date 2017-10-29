class AddPlayersToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :white_id, :integer
    add_column :games, :black_id, :integer
  end
end

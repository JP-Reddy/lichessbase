class RemoveWinnerFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :winner, :string
    add_column :games, :winner_id, :integer
  end
end

class CreateTournamentGames < ActiveRecord::Migration[5.1]
  def change
    create_table :tournament_games do |t|
      t.string :tid
      t.integer :tournament_id
      t.integer :game_id
      t.string :gid

      t.timestamps
    end
  end
end

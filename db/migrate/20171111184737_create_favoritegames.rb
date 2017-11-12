class CreateFavoritegames < ActiveRecord::Migration[5.1]
  def change
    create_table :favoritegames do |t|
      t.string :gid
      t.string :pgn
      t.integer :game_id
      t.integer :user_id
      t.timestamps
    end
  end
end

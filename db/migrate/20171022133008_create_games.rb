class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :gid
      t.string :winner
      t.integer :white_rating
      t.integer :black_rating


      t.timestamps
    end
    add_index :games, :gid, unique: true

  end
end

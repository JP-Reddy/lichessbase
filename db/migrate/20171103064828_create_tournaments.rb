class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.string :tid
      t.string :name
      t.integer :avg_rating
      t.timestamp :start
      t.timestamp :end

      t.timestamps
    end
  end
end

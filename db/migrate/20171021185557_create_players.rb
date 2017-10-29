class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :pname
      t.string :country
      t.integer :BRating
      t.integer :SRating

      t.timestamps
    end
    add_index :players, :pname, unique: true
  end
end

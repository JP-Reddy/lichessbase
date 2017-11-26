class AddIndexToTournaments < ActiveRecord::Migration[5.1]
  def change
    add_index :tournaments, :tid, unique: true
  end
end

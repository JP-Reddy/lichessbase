class AddPlayerIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :player_id, :integer
  end
end

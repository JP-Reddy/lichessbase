class AddGametypeIdToTournaments < ActiveRecord::Migration[5.1]
  def change
    add_column :tournaments, :gametype_id, :integer
  end
end

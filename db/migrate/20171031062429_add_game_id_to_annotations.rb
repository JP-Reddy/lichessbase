class AddGameIdToAnnotations < ActiveRecord::Migration[5.1]
  def change
    add_column :annotations, :game_id, :integer
  end
end

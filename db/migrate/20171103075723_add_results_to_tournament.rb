class AddResultsToTournament < ActiveRecord::Migration[5.1]
  def change
    add_column :tournaments, :first_id, :integer
    add_column :tournaments, :first_score, :integer
 	add_column :tournaments, :second_id, :integer
 	add_column :tournaments, :second_score, :integer
    add_column :tournaments, :third_id, :integer
    add_column :tournaments, :third_score, :integer

  end
end

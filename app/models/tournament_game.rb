class TournamentGame < ApplicationRecord
	belongs_to :tournament, :class_name => 'Tournament'
	belongs_to :game, :class_name =>'Game'

end

class Game < ApplicationRecord
	belongs_to :gametype
	belongs_to :white, :class_name => 'Player'
	belongs_to :black, :class_name => 'Player'
	has_many :annotations
	has_one :tournament_game, :class_name =>'TournamentGame'
	has_one :tournament, :class_name => 'Tournament', through: :tournament_game
end

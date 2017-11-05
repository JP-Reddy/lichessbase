class Tournament < ApplicationRecord
	has_many :tournament_games, :class_name => 'TournamentGame'
	has_many :games, :class_name => 'Game', through: :tournament_games
end

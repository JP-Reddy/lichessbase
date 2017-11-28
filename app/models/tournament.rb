class Tournament < ApplicationRecord
	has_many :tournament_games, :class_name => 'TournamentGame'
	has_many :games, :class_name => 'Game', through: :tournament_games
	# has_many :participants, :class_name => 'Participant'
	# has_many :players, :class_name => 'Player',, through: :participants
	has_and_belongs_to_many :players
	belongs_to :gametype, :class_name => 'Gametype'
	validates_uniqueness_of :tid
end

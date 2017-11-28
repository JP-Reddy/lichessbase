class Gametype < ApplicationRecord
	has_many :games, :class_name => 'Game'
	has_many :tournaments, :class_name => 'Tournament'
end

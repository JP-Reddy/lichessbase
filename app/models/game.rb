class Game < ApplicationRecord
	belongs_to :gametype
	belongs_to :white, :class_name => 'Player'
	belongs_to :black, :class_name => 'Player'
end

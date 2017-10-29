class Gametype < ApplicationRecord
	has_many :games, :class_name => 'Game'
end

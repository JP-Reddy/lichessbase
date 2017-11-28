class Player < ApplicationRecord
	has_one :user
	has_many :played_white, :class_name => 'Game', :foreign_key => 'white_id'
	has_many :played_black, :class_name => 'Game', :foreign_key => 'black_id'
	has_and_belongs_to_many :tournaments
end

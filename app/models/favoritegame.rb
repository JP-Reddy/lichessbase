class Favoritegame < ApplicationRecord
	mount_uploader :pgn, PgnUploader # Tells rails to use this uploader for this model.
	  # validates :gid, presence: true
	belongs_to :user 
end

class GamesController < ApplicationController

	before_action :find_game, only: [:show,:edit,:update,:destroy]

	def index
		if params[:gametype].blank?
			@gtid_blitz=Gametype.find_by(name:"Blitz")
			# @blitz=Game.where(gtid: gtid_blitz)
			@gtid_bullet=Gametype.find_by(name:"Bullet")
			# @blitz=Game.where(gtid: gtid_bullet)
			@gtid_classical=Gametype.find_by(name:"Classical")
			# @blitz=Game.where(gtid: gtid_classical)
		else
			@gametype_id=Gametype.find_by(name: params[:gametype])
			@games=Game.where(:gametype_id => @gametype_id).order("created_at DESC")
		end


	end


	def edit
		respond_to do |format|
		  format.js {render layout: false} # Add this line to you respond_to block
		end
	end
	def update
	end
	def show
		respond_to do |format|
			format.html
		  	format.js 
		  # {render layout: false} # Add this line to you respond_to block
		end
	
	end
	def destroy
	end

	private

	def game_params
		params.require(:game).permit(:id,:winner_id,:white_id,:black_id,:white_rating,:black_rating)
	end

	def find_game
		@game=Game.find(params[:id])
	end

end

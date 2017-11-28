class PlayersController < ApplicationController
	before_action :find_player, only: :show 

  def index
  	# @players=Player.all.order("SRating DESC")
  	# @cplayers=Player.all.sort! { |a,b| a.SRating <=> b.SRating }
  	# @bplayers=Player.all.sort! { |a,b| a.BRating <=> b.BRating }
  	@cplayers=Player.all.order(SRating: :desc)
  	# puts @cplayers.length
  	@bplayers=Player.all.order(BRating: :desc)


  end

  def show
    @cgames=[]
    @bgames=[]
    @bugames=[]
    @player.played_white.each {|game|
      if game.gametype.name=="Classical"
        @cgames<<game
      elsif game.gametype.name=="Blitz"
        @bgames<<game
      elsif game.gametype.name=="Bullet"
        @bugames<<game
      else
      end
    }
    @player.played_black.each {|game|
      if game.gametype.name=="Classical"
        @cgames<<game
      elsif game.gametype.name=="Blitz"
        @bgames<<game
      elsif game.gametype.name=="Bullet"
        @bugames<<game
      else
      end
    }

  end

  private 

  def player_params
  	params.require(:player).permit(:id)
  end

  def find_player
  	@player=Player.find(params[:id])
  end

end

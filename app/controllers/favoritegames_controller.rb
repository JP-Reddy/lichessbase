class FavoritegamesController < ApplicationController

  before_action :authenticate_user!, only: [:edit,:new,:update,:destroy,:create]
  before_action :find_fav_game, only: [:update,:destroy,:show,:edit]
  def index
    @fav_games=Favoritegame.all
  end

  def new
    @fav_game=Favoritegame.new
  end

  def create
    find=Game.find_by(gid: params[:gid])
    if find.nil?
      @fav_game=Favoritegame.new(fav_game_params)
      # @fav_game.game_id=find.id
      @fav_game.user_id=current_user.id
      if @fav_game.save
         redirect_to favoritegames_path, notice: "Your game has been uploaded."
      else
         render "new"
      end
    end
  end

  def edit

  end

  def update
    @fav_game.update(fav_game_params)
    if @fav_game.save
      redirect_to favoritegame_path(@fav_game)
    else
      render 'edit'
    end
  end

  def destroy
    @fav_game.delete
    redirect_to favoritegames_path, notice:  "The game has been deleted."
  end

  private 

  def fav_game_params
    params.require(:favoritegame).permit(:gid,:pgn)
  end

  def find_fav_game
    @fav_game=Favoritegame.find(params[:id])
  end

  # def verify_user
  #   if current_user.id==@fav_game.user_id

  #   end
  # end
end

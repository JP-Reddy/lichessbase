class TournamentsController < ApplicationController
  before_action :find_tournament, only: :show
  def index
    @tours=Tournament.all
  end

  def show

  end

  private

  def tournament_params
    params.require(:tournament).permit(:id)
  end

  def find_tournament
    @tour=Tournament.find(params[:id])
  end
end

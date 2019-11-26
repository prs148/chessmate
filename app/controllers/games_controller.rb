class GamesController < ApplicationController

  
  def index
    @games = Game.available
  end

  def create
    @game = current_user.games.create(game_params)
    redirect_to root_path
  end

  def new
    @game = Game.new
  end


  private

  def game_params
    params.required(:game).permit(:name, :black_player_id).with_defaults(white_player_id: current_user.id)
  end

end

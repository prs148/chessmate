class GamesController < ApplicationController

  
  def index
  @games = Game.all 
  end

  def new 
  @game = Game.new 
  end   

  def create 
  @game = current_user.game.create(game_params)
end

  private

  def game_params 
    params.require(:game).permit(:name, :white_player_id, :black_player_id)
  end

end


  
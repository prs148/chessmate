class GamesController < ApplicationController

  
  def index
    @games = Game.all 
    @players = User.all # user_id is tied to white_player_id and black_player_id
    @game = Game.new 
  end
 

  def create 
  @game = Game.create (game_params)
  redirect_to games_path

end

  private

  def game_params 
    params.require(:game).permit(:name, :white_player_id, :black_player_id)
    
  end

end


  
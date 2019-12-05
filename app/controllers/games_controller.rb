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

  def get_pieces
  end

  def show 
    @game = Game.find(params[:id])
   
  end 

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(:black_player_id => current_user.id) 
    @game.pieces.where(color: 'black').update(player_id: @game.black_player_id) 
    redirect_to game_path(@game)

  end 

  private

  def game_params
    params.required(:game).permit(:name, :black_player_id).with_defaults(white_player_id: current_user.id)
  end

end

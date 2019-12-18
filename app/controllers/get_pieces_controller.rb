class GetPiecesController < ApplicationController



  def index
     # @game = Game.find(params[:id])
     # render json: @game.pieces
  end  

  def show 
    @game = Game.find(params[:id])
    render json: {:pieces => @game.pieces, :player_turn => @game.player_turn}
    
  end 
end

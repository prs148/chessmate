class GetPiecesController < ApplicationController
  
  def index
   
  end  

  def show 
    @game = Game.find(params[:id])
    render json: @game.pieces
  end 
end

class PiecesController < ApplicationController
  
  def show 
      @piece = Piece.find(params[:id])
      render json: @piece
  end


  def update
    x = params[:x_position].to_i
    y = params[:y_position].to_i
    @piece = Piece.find(params[:id])
    if @piece.valid_move?(x, y) 
      @piece.game.piece_at(x, y)&.remove!
      @piece.update piece_params 
      render json: @piece 
    else        
      return redirect_to @piece.game
    end
          
    
  end 



  private 

  def piece_params
    params.permit(:x_position, :y_position)
  end 
end

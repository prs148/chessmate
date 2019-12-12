class PiecesController < ApplicationController
  
  def show 
      @piece = Piece.find(params[:id])
      render json: @piece
  end


  def update
      @piece = Piece.find(params[:id])
      unless @piece.valid_move?(params[:x_position].to_i,
                                params[:y_position].to_i)
        return redirect_to @piece.game
      end
      if @piece.update piece_params
        render json: @piece
      end
  
  end 

  private 

  def piece_params
    params.permit(:x_position, :y_position)
  end 
end

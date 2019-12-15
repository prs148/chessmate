class PiecesController < ApplicationController
  
  def show 
      @piece = Piece.find(params[:id])
      render json: @piece
  end


  def update
    @piece = Piece.find(params[:id])
      if @piece.valid_move?(params[:x_position].to_i,params[:y_position].to_i) 

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

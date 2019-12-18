class PiecesController < ApplicationController
  
  def show 
      @piece = Piece.find(params[:id])
      render json: @piece
  end


  def update
    x = params[:x_position].to_i
    y = params[:y_position].to_i
    @piece = Piece.find(params[:id])

    game_id = @piece.game_id
    game = Game.find(game_id)
    unless game.player_turn == @piece.color
      render json: {:piece => @piece, :player_turn => game.player_turn, :error => 'You are not allowed to move!'}
      return
    end

    if @piece.valid_move?(x, y)
        @piece.game.piece_at(x, y)&.remove!
        @piece.update piece_params 
        game.flip_player_turn


        render json: {:piece => @piece, :player_turn => game.player_turn} 
     
     else        

      return redirect_to @piece.game
    end
          
    
  end 



  private 

  def piece_params
    params.permit(:x_position, :y_position)
  end 
end

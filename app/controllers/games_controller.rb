class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  
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

  # def update
  #   game = 
  #   piece = Piece.find(params[:id])
  #   if piece.valid_move?
  #     update active record
  #     render plain great job! 
  #   else
  #     return error
  #   end
  # end


  def get_pieces

  end

  def show 
    @game = Game.find(params[:id])
    render :layout => 'empty'
    # render json: @game.pieces
  end 

  private

  def game_params
    params.required(:game).permit(:name, :black_player_id).with_defaults(white_player_id: current_user.id)
  end

end

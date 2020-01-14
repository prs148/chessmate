class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :update]
  
  def index
    @games = Game.available
    if(current_user.present?) 
      @started =  Game.where((:white_player_id || :black_player_id) == current_user.id)
    end
  end

  def create
    @game = current_user.games.create(game_params)
    @game.populate_game
    redirect_to root_path
  end

  def new
    @game = Game.new
  end



  def update
    @game = Game.find(params[:id])
    @game.update_attributes(:black_player_id => current_user.id) 
    @game.pieces.where(color: 'black').update(player_id: @game.black_player_id) 
    redirect_to game_path(@game)


  end 

  def show 
    if(current_user.present?)
      @game = Game.find(params[:id])
    else
      redirect_to new_user_session_path
    end
    render :layout => 'empty'
    # render json: @game.pieces
  end 

  private

  def game_params
    params.required(:game).permit(:name, :black_player_idf).with_defaults(white_player_id: current_user.id)
  end

end

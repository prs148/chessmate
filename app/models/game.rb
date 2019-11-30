class Game < ApplicationRecord
  scope :available, -> { where(white_player_id: nil).or(where(black_player_id: nil))}
  belongs_to :user
  has_many :pieces
  after_create :populate_game


  def populate_game
    Pawn.create(game_id: id, x_position: 1, y_position: 1, color: "white", status: true)

  end


  def piece_at(x, y)
    pieces.where(x_position: x, y_position: y).take
  end


  # def color 
  #   if black_player_id
  #     return true 

  #   else 
  #     return false 


  # end


 
end

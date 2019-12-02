class Game < ApplicationRecord
  scope :available, -> { where(white_player_id: nil).or(where(black_player_id: nil))}
  belongs_to :user
  has_many :pieces
  after_create :populate_game


  def populate_game
    #white pieces

    (0..7).each do |i|
      Pawn.create(game_id: id, x_position: i, y_position: 6, color: "white", status: true)
    end 

    Rook.create(game_id: id, x_position: 0, y_position: 7, color: "white", status: true) 
    Rook.create(game_id: id, x_position: 7, y_position: 7, color: "white", status: true) 

    Knight.create(game_id: id, x_position: 1, y_position: 7, color: "white", status: true) 
    Knight.create(game_id: id, x_position: 6, y_position: 7, color: "white", status: true)

    Bishop.create(game_id: id, x_position: 2, y_position: 7, color: "white", status: true)
    Bishop.create(game_id: id, x_position: 5, y_position: 7, color: "white", status: true)

    King.create(game_id: id, x_position: 3, y_position: 7, color: "white", status: true)
    Queen.create(game_id: id, x_position: 4, y_position: 7, color: "white", status: true)

    #black pieces
    (0..7).each do |i|
      Pawn.create(game_id: id, x_position: i, y_position: 1, color: "black", status: true)
    end 

    Rook.create(game_id: id, x_position: 0, y_position: 0, color: "black", status: true) 
    Rook.create(game_id: id, x_position: 7, y_position: 0, color: "black", status: true) 

    Knight.create(game_id: id, x_position: 1, y_position: 0, color: "black", status: true) 
    Knight.create(game_id: id, x_position: 6, y_position: 0, color: "black", status: true)

    Bishop.create(game_id: id, x_position: 2, y_position: 0, color: "black", status: true)
    Bishop.create(game_id: id, x_position: 5, y_position: 0, color: "black", status: true)

    King.create(game_id: id, x_position: 3, y_position: 0, color: "black", status: true)
    Queen.create(game_id: id, x_position: 4, y_position: 0, color: "black", status: true)

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

class Game < ApplicationRecord
  scope :available, -> { where(white_player_id: nil).or(where(black_player_id: nil))}
  belongs_to :user
  has_many :pieces
  after_create :populate_game


  def populate_game
    #black pieces 

    (0..7).each do |i|
      Pawn.create(game_id: id, x_position: i, y_position: 6, color: "black", status: true)
    end 

    Rook.create(game_id: id, x_position: 0, y_position: 7, color: "black", status: true, player_id: self.black_player_id) 
    Rook.create(game_id: id, x_position: 7, y_position: 7, color: "black", status: true) 

    Knight.create(game_id: id, x_position: 1, y_position: 7, color: "black", status: true) 
    Knight.create(game_id: id, x_position: 6, y_position: 7, color: "black", status: true)

    Bishop.create(game_id: id, x_position: 2, y_position: 7, color: "black", status: true)
    Bishop.create(game_id: id, x_position: 5, y_position: 7, color: "black", status: true)

    King.create(game_id: id, x_position: 3, y_position: 7, color: "black", status: true)
    Queen.create(game_id: id, x_position: 4, y_position: 7, color: "black", status: true)

    #white pieces
    (0..7).each do |i|
      Pawn.create(game_id: id, x_position: i, y_position: 1, color: "white", status: true)
    end 

    Rook.create(game_id: id, x_position: 0, y_position: 0, color: "white", status: true) 
    Rook.create(game_id: id, x_position: 7, y_position: 0, color: "white", status: true) 

    Knight.create(game_id: id, x_position: 1, y_position: 0, color: "white", status: true) 
    Knight.create(game_id: id, x_position: 6, y_position: 0, color: "white", status: true)

    Bishop.create(game_id: id, x_position: 2, y_position: 0, color: "white", status: true)
    Bishop.create(game_id: id, x_position: 5, y_position: 0, color: "white", status: true)

    King.create(game_id: id, x_position: 3, y_position: 0, color: "white", status: true)
    Queen.create(game_id: id, x_position: 4, y_position: 0, color: "white", status: true)

  end


  def piece_at(x, y)
    pieces.where(x_position: x, y_position: y).take
  end


 

  def check?(player)
    king = pieces.where(piece_type: "King", player_id: player.id).take
    pieces.where(player_id: opposing_player_id(player.id)).any? do |p|
      p.valid_move?(king.x_position, king.y_position)
    end
  end

  def opposing_player_id(player_id)
    return white_player_id if black_player_id == player_id
    return black_player_id if white_player_id == player_id
    
    nil
  end

end

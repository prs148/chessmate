class Game < ApplicationRecord
  scope :available, -> { where(white_player_id: nil).or(where(black_player_id: nil))}
  belongs_to :user
  has_many :pieces


  def populate_game
    #black pieces 

    (0..7).each do |i|
      Pawn.create(game_id: id, x_position: i, y_position: 6, color: "black", status: true, image: 'pwn_blk.png')
    end 

    Rook.create(game_id: id, x_position: 0, y_position: 7, color: "black", status: true, image: 'rk_blk.png') 
    Rook.create(game_id: id, x_position: 7, y_position: 7, color: "black", status: true, image: 'rk_blk.png') 

    Knight.create(game_id: id, x_position: 1, y_position: 7, color: "black", status: true, image: 'knght_blk.png') 
    Knight.create(game_id: id, x_position: 6, y_position: 7, color: "black", status: true, image: 'knght_blk.png')

    Bishop.create(game_id: id, x_position: 2, y_position: 7, color: "black", status: true, image: 'bish_blk.png')
    Bishop.create(game_id: id, x_position: 5, y_position: 7, color: "black", status: true, image: 'bish_blk.png')

    King.create(game_id: id, x_position: 3, y_position: 7, color: "black", status: true, image: 'king_blk.png')
    Queen.create(game_id: id, x_position: 4, y_position: 7, color: "black", status: true, image: 'qn_blk.png')

    #white pieces
    (0..7).each do |i|
      Pawn.create(game_id: id, x_position: i, y_position: 1, color: "white", status: true, image: 'pwn_wht.png')
    end 

    Rook.create(game_id: id, x_position: 0, y_position: 0, color: "white", status: true, image: 'rk_wht.png') 
    Rook.create(game_id: id, x_position: 7, y_position: 0, color: "white", status: true, image: 'rk_wht.png') 

    Knight.create(game_id: id, x_position: 1, y_position: 0, color: "white", status: true, image: 'knght_wht.png') 
    Knight.create(game_id: id, x_position: 6, y_position: 0, color: "white", status: true, image: 'knght_wht.png')

    Bishop.create(game_id: id, x_position: 2, y_position: 0, color: "white", status: true, image: 'bish_wht.png')
    Bishop.create(game_id: id, x_position: 5, y_position: 0, color: "white", status: true, image: 'bish_wht.png')

    King.create(game_id: id, x_position: 3, y_position: 0, color: "white", status: true, image: 'kng_wht.png')
    Queen.create(game_id: id, x_position: 4, y_position: 0, color: "white", status: true, image: 'qn_wht.png')

  end

  def players
    white_player_id.present? && black_player_id.present? ? 2 : 1
  end

  def piece_at(x, y)
    pieces.where(x_position: x, y_position: y).take
  end


  def check?(color)
    king = pieces.where(piece_type: "King", color: color).take
    pieces.where(color: opposing_color(color)).any? do |p|
      p.valid_move?(king.x_position, king.y_position)
    end
  end

 call_valid_move
  def opposing_color(color)
    return "white" if color == "black"
    return "black" if color == "white"

    
    nil
  end

end

class Game < ApplicationRecord
  scope :available, -> { where(white_player_id: nil).or(where(black_player_id: nil))}
  belongs_to :user
  has_many :pieces

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

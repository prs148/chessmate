class Game < ApplicationRecord
  scope :available, -> { where(white_player_id: nil).or(where(black_player_id: nil))}
  belongs_to :user
  has_many :pieces

  def piece_at(x, y)
    pieces.where(x_position: x, y_position: y).take
  end
end

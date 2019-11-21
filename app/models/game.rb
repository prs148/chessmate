class Game < ApplicationRecord
  scope :available, -> { where(white_player_id: nil).or(black_player_id: nil)}
  belongs_to :user
  has_many :pieces
  


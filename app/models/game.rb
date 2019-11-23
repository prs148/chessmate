class Game < ApplicationRecord
  scope :available, -> { where(white_player_id: true).or(black_player_id: true)}
  belongs_to :user
  has_many :pieces
  
end

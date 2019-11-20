class Game < ApplicationRecord
  scope :available, -> { where("white_player_id IS NULL OR black_player_id IS NULL") }
  belongs_to :user
  has_many :pieces

  def populate_game!
    self.new([
      Pawn.new('1', '1')
    ])
  end
  
  
end

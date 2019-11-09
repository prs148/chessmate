require 'rails_helper'

RSpec.describe Game, type: :model do
    it "should detect obstructions" do
    game = Game.create
    piece = Piece.new
    piece.x_position = 1
    piece.y_position = 1
    piece.game_id = game.id
    piece.save

    expect(game.is_obstructed?(0, 0, 2, 2)).to eq true
    expect(game.is_obstructed?(0, 0, 0, 4)).to eq false
  end  
end

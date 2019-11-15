require 'rails_helper'

RSpec.describe Piece, type: :model do
  it "should detect obstructions" do
    game = Game.create
    piece = create_piece_for_game(game,1,1)
    create_piece_for_game(game,1,4)
    expect(piece.is_obstructed?(2, 2)).to eq false
    expect(piece.is_obstructed?(1, 6)).to eq true
  end
  def create_piece_for_game (game,x_position,y_position)
    piece = Piece.new
    piece.x_position = x_position
    piece.y_position = y_position
    game.pieces.push(piece)
    piece.save
    piece
  end
end

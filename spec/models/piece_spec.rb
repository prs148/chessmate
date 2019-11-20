require 'rails_helper'

RSpec.describe Piece, type: :model do
  it "should detect diagonal obstructions" do
    game = build(:game)
    piece = create_piece_for_game(game,4,4)
    expect(piece.is_obstructed?(0, 0)).to eq false

    create_piece_for_game(game,3,3)
    create_piece_for_game(game,6,6)
    create_piece_for_game(game,2,6)
    create_piece_for_game(game,6,2)

    expect(piece.is_obstructed?(2, 2)).to eq true
    expect(piece.is_obstructed?(7, 7)).to eq true
    expect(piece.is_obstructed?(1, 7)).to eq true
    expect(piece.is_obstructed?(7, 1)).to eq true
    expect(piece.is_obstructed?(5, 5)).to eq false
  end
  it "should detect vertical obstructions" do
    game = build(:game)
    piece = create_piece_for_game(game,1,2)
    create_piece_for_game(game,1,3)
    create_piece_for_game(game,1,1)
    expect(piece.is_obstructed?(1, 4)).to eq true
    expect(piece.is_obstructed?(1, 0)).to eq true
  end
  it "should detect horizontal obstructions" do
    game = build(:game)
    piece = create_piece_for_game(game,4,1)
    create_piece_for_game(game,6,1)
    create_piece_for_game(game,2,1)
    expect(piece.is_obstructed?(0, 1)).to eq true
    expect(piece.is_obstructed?(7, 1)).to eq true
  end
  def create_piece_for_game (game,x_position,y_position)
    piece = Piece.new
    piece.x_position = x_position
    piece.y_position = y_position
    game.pieces.push(piece)
    piece.save
    game.save
    piece
  end
end

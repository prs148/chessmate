require 'rails_helper'

RSpec.describe Piece, type: :model do
  before(:all) do
    @white_player = create(:user)
    @black_player = create(:user)
  end
  before(:each) do
    @game = create(:game)
    @game.white_player_id = @white_player.id
    @game.black_player_id = @black_player.id
    @game.save
  end

  it "should detect diagonal obstructions" do
    game = build(:game)
    piece = create_generic_piece_for_game(game,4,4)
    expect(piece.is_obstructed?(0, 0)).to eq false

    create_generic_piece_for_game(game,3,3)
    create_generic_piece_for_game(game,6,6)
    create_generic_piece_for_game(game,2,6)
    create_generic_piece_for_game(game,6,2)

    expect(piece.is_obstructed?(2, 2)).to eq true
    expect(piece.is_obstructed?(7, 7)).to eq true
    expect(piece.is_obstructed?(1, 7)).to eq true
    expect(piece.is_obstructed?(7, 1)).to eq true
    expect(piece.is_obstructed?(5, 5)).to eq false
  end
  it "should detect vertical obstructions" do
    game = build(:game)
    piece = create_generic_piece_for_game(game,1,2)
    create_generic_piece_for_game(game,1,3)
    create_generic_piece_for_game(game,1,1)
    expect(piece.is_obstructed?(1, 4)).to eq true
    expect(piece.is_obstructed?(1, 0)).to eq true
  end
  it "should detect horizontal obstructions" do
    game = build(:game)
    piece = create_generic_piece_for_game(game,4,1)
    create_generic_piece_for_game(game,6,1)
    create_generic_piece_for_game(game,2,1)
    expect(piece.is_obstructed?(0, 1)).to eq true
    expect(piece.is_obstructed?(7, 1)).to eq true
  end

  it "pinned pieces should be able take enemy king" do
    game = build(:game)
    create_piece_for_game(King,0,0)
    piece = create_piece_for_game(Rook,0,1)
    create_piece_for_game(Rook,0,2,color = "black")
    create_piece_for_game(King,2,1,color = "black")
    expect(piece.valid_move?(2,1)).to eq true
  end

  it "pinned pieces should not be able to reveal check" do
    game = build(:game)
    create_piece_for_game(King,0,0)
    piece = create_piece_for_game(Rook,0,1)
    create_piece_for_game(Rook,0,2,color = "black")
    expect(piece.valid_move?(2,1)).to eq false
  end


  def create_generic_piece_for_game (game,x_position,y_position)
    piece = Piece.new
    piece.x_position = x_position
    piece.y_position = y_position
    game.pieces.push(piece)
    piece.save
    game.save
    piece
  end

  def create_piece_for_game(type, xpos, ypos, color = "white")
    @game.pieces << type.create(x_position: xpos,
                                y_position: ypos,
                                color: color)
    @game.pieces.last
  end
end

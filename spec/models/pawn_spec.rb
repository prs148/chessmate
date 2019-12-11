require 'rails_helper'

RSpec.describe Pawn, type: :model do
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


  context 'movement tests' do 
    it "should only move vertically" do 
      pawn = create_piece_for_game(Pawn, 0, 1)
      expect(pawn.valid_move?(0,2)).to eq(true)
      expect(pawn.valid_move?(0,3)).to eq(true)
      expect(pawn.valid_move?(1,1)).to eq(false)
    
    end

    it "can move 1 or 2 spaces on first move" do 
      pawn = create_piece_for_game(Pawn, 0, 1)
      expect(pawn.valid_move?(0,2)).to eq(true)
      expect(pawn.valid_move?(0,3)).to eq(true)
    end

    it "can only move 1 space if not first move" do
      pawn = create_piece_for_game(Pawn, 0, 4)
      expect(pawn.valid_move?(0,2)).to eq(false)
      expect(pawn.valid_move?(0,5)).to eq(true)
    end
  end


  def create_piece_for_game(type, xpos, ypos, color = "white")
    @game.pieces << type.create(x_position: xpos,
                                y_position: ypos,
                                color: color)
    @game.pieces.last
  end
end

require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
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

  context "valid move update checks" do
    it "should update to captured position" do
      sign_in @white_player
      game = build(:game)
      piece = create_piece_for_game(Rook, 4, 1)
      create_piece_for_game(Rook, 4, 0, "black")
      put :update, format: :xhr, params: { id: piece.id, x_position: 4, y_position: 0 }
      expect(piece.reload.at?(4, 0)).to eq true
    end
  end

  def create_piece_for_game(type, xpos, ypos, color = "white")
    @game.pieces << type.create(x_position: xpos,
                                y_position: ypos,
                                color: color)
    @game.pieces.last
  end

end

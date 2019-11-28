RSpec.describe Rook, type: :model do
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
    it "should move horizontally" do
      rook = create_piece_for_game(Rook, 4, 4)
      expect(rook.valid_move?(6, 4)).to eq(true)
      expect(rook.valid_move?(0, 4)).to eq(true)
    end

    it "should move vertically" do
      rook = create_piece_for_game(Rook, 4, 4)
      expect(rook.valid_move?(4, 2)).to eq(true)
      expect(rook.valid_move?(4, 6)).to eq(true)
    end

    it "should not move diagonally" do
      rook = create_piece_for_game(Rook, 4, 4)
      expect(rook.valid_move?(5, 5)).to eq(false)
      expect(rook.valid_move?(6, 6)).to eq(false)
      expect(rook.valid_move?(3, 5)).to eq(false)
      expect(rook.valid_move?(2, 2)).to eq(false)
    end
  end

  def create_piece_for_game(type, xpos, ypos, player_id = @white_player.id)
    @game.pieces << type.create(x_position: xpos,
                                y_position: ypos,
                                player_id: player_id)
    @game.pieces.last
  end
end
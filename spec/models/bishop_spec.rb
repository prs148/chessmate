RSpec.describe Bishop, type: :model do
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
    it "should move up and to the right" do
      bishop = create_piece_for_game(Bishop, 4, 4)
      expect(bishop.valid_move?(5, 5)).to eq(true)
      expect(bishop.valid_move?(6, 6)).to eq(true)
    end

    it "should move down to the left" do
      bishop = create_piece_for_game(Bishop, 4, 4)
      expect(bishop.valid_move?(3, 3)).to eq(true)
      expect(bishop.valid_move?(0, 0)).to eq(true)
    end

    it "should move down and to the right" do
      bishop = create_piece_for_game(Bishop, 4, 4)
      expect(bishop.valid_move?(5, 3)).to eq(true)
      expect(bishop.valid_move?(6, 2)).to eq(true)
      expect(bishop.valid_move?(7, 1)).to eq(true)
      expect(bishop.valid_move?(8, 0)).to eq(false)
    end

    it "should move up and to the left" do
      bishop = create_piece_for_game(Bishop, 4, 4)
      expect(bishop.valid_move?(3, 5)).to eq(true)
      expect(bishop.valid_move?(2, 6)).to eq(true)
      expect(bishop.valid_move?(1, 7)).to eq(true)
      expect(bishop.valid_move?(0, 8)).to eq(false)
    end

    it "should not move nondiagonally" do
      bishop = create_piece_for_game(Bishop, 4, 4)
      expect(bishop.valid_move?(5, 4)).to eq(false)
      expect(bishop.valid_move?(0, 7)).to eq(false)
      expect(bishop.valid_move?(0, 4)).to eq(false)
      expect(bishop.valid_move?(3, 0)).to eq(false)
    end

    it "should be able to take enemy pieces" do
      bishop = create_piece_for_game(Bishop, 4, 4)
      create_piece_for_game(Rook, 0, 0, @black_player)
      expect(bishop.valid_move?(0, 0)).to eq(true)
      create_piece_for_game(Rook, 2, 2, @black_player)
      expect(bishop.valid_move?(0, 0)).to eq(false)
    end
  end

  def create_piece_for_game(type, xpos, ypos, player = @white_player)
    @game.pieces << type.create(x_position: xpos,
                                y_position: ypos,
                                player_id: player.id)
    @game.pieces.last
  end
end
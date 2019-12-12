RSpec.describe Queen, type: :model do
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
      queen = create_piece_for_game(Queen, 4, 4)
      expect(queen.valid_move?(6, 4)).to eq(true)
      expect(queen.valid_move?(0, 4)).to eq(true)
    end

    it "should move vertically" do
      queen = create_piece_for_game(Queen, 4, 4)
      expect(queen.valid_move?(4, 2)).to eq(true)
      expect(queen.valid_move?(4, 6)).to eq(true)
    end

    it "should move diagonally" do
      queen = create_piece_for_game(Queen, 4, 4)
      expect(queen.valid_move?(5, 5)).to eq(true)
      expect(queen.valid_move?(6, 6)).to eq(true)
      expect(queen.valid_move?(3, 5)).to eq(true)
      expect(queen.valid_move?(2, 2)).to eq(true)
    end

    it "should not move like a knight" do 
      queen = create_piece_for_game(Queen, 4, 4) 
      expect(queen.valid_move?(5,6)).to eq(false)
    end
    
  end

  def create_piece_for_game(type, xpos, ypos, color = "white")
    @game.pieces << type.create(x_position: xpos,
                                y_position: ypos,
                                color: color)
    @game.pieces.last
  end
end
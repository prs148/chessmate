RSpec.describe King, type: :model do
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
    it "should move in all eight directions" do
      king = create_piece_for_game(King, 4, 4)
      positions = (3..5).to_a.product((3..5).to_a)
      positions.reject! { |p| p == [4, 4] }
      positions.all? {|x, y| king.valid_move?(x, y) }
    end

    it "should not move two spaces away" do
      king = create_piece_for_game(King, 4, 4)
      expect(king.valid_move?(6, 4)).to eq(false)
      expect(king.valid_move?(4, 6)).to eq(false)
      expect(king.valid_move?(2, 4)).to eq(false)
      expect(king.valid_move?(2, 2)).to eq(false)
    end
  end

  def create_piece_for_game(type, xpos, ypos, color = "white")
    @game.pieces << type.create(x_position: xpos,
                                y_position: ypos,
                                color: color)
    @game.pieces.last
  end
end
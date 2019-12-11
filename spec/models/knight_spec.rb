RSpec.describe Knight, type: :model do
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
    it "should move in all valid L positions" do
      knight = create_piece_for_game(Knight, 4, 4)
      expect(knight.valid_move?(6, 5)).to eq(true)
      expect(knight.valid_move?(6, 3)).to eq(true)
      expect(knight.valid_move?(2, 5)).to eq(true)
      expect(knight.valid_move?(2, 3)).to eq(true)
      expect(knight.valid_move?(5, 6)).to eq(true)
      expect(knight.valid_move?(3, 6)).to eq(true)
      expect(knight.valid_move?(5, 2)).to eq(true)
      expect(knight.valid_move?(3, 2)).to eq(true)
    end

    it "shouldn't be able to be obstructed" do
      knight = create_piece_for_game(Knight, 4, 4)
      (0..7).each do |x|
        create_piece_for_game(Pawn, x, 5)
      end
      expect(knight.valid_move?(5, 6)).to eq(true)
      expect(knight.valid_move?(3, 6)).to eq(true)
    end

    it "should not move in a straight line" do
      knight = create_piece_for_game(Knight, 4, 4)
      expect(knight.valid_move?(4, 7)).to eq(false)
      expect(knight.valid_move?(7, 4)).to eq(false)
      expect(knight.valid_move?(1, 4)).to eq(false)
      expect(knight.valid_move?(4, 0)).to eq(false)
    end
  end

  def create_piece_for_game(type, xpos, ypos, color = "white")
    @game.pieces << type.create(x_position: xpos,
                                y_position: ypos,
                                color: color)
    @game.pieces.last
  end
end
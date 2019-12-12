require 'rails_helper'

RSpec.describe Game, type: :model do
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
  context "check checks" do
    it "should detect check from bishop" do
      king = create_piece_for_game(King, 4, 4)
      bishop = create_piece_for_game(Bishop, 6, 6, "black")
      expect(@game.check?("white")).to eq(true) 

    end
  end 

  def create_piece_for_game(type, xpos, ypos,color = "white")
    @game.pieces << type.create(x_position: xpos,
                                y_position: ypos,
                                color: color)
    @game.pieces.last
  end
  
end

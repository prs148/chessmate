require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "games#create action" do
    it "should create a game in the database" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: {
        game: {
          name: "test game",
          white_player_id: user.id,
          black_player_id: 5,
          user_id: user.id,
        }
      }
      game = Game.last
      expect(game.name).to eq('test game')
    end

    it "should not list unavalable games as available" do
      user_black = FactoryBot.create(:user)
      user_white = FactoryBot.create(:user)
      sign_in user_black
      sign_in user_white

      post :create, params: {
        game: {
          name: "test game",
          white_player_id: user_white.id,
          black_player_id: user_black.id,
        }
      }
      games = Game.available
      expect(games.empty?).to eq(true)
    end
  end
end

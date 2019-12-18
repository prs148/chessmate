class GamesAddPlayerTurn < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :player_turn, :string, :default => "white"
  end
end

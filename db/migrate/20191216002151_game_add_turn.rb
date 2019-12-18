class GameAddTurn < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :player_turn, :boolean
  end
end

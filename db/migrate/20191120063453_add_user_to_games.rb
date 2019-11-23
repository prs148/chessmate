class AddUserToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :user_id, :integer
    add_column :games, :winner, :integer
    add_foreign_key :games, :users, column: :winner
    add_foreign_key :games, :users, column: :white_player_id
    add_foreign_key :games, :users, column: :black_player_id
  end
end

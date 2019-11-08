class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces, force: true do |t|
      t.integer :x_position
      t.integer :y_position
      t.string :piece_type
      t.integer :player_id
      t.integer :game_id

      t.timestamps
    end

    add_index :pieces, :game_id
    add_index :pieces, :player_id 
  end
end

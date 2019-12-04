class AddStatusAndColorToPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :status, :boolean
    add_column :pieces, :color, :string
  end
end

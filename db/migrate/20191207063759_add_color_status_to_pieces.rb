class AddColorStatusToPieces < ActiveRecord::Migration[5.2]
  def change
  add_column :pieces, :color, :string
  add_column :pieces, :status, :boolean
  end
end

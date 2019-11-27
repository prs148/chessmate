class Rook < Piece
  def valid_move?(x, y)
    super(x, y) &&
      (x_position == x || y_position == y )
  end 
end
class Bishop < Piece
  def valid_move?(x, y)
    super(x, y) &&
      (x + y == x_position + y_position ||
      x - y == x_position - y_position)
  end
end
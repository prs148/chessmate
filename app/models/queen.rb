class Queen < Piece 

  def valid_move?(x, y)
      super(x, y) &&
        (x_position == x || y_position == y ||
        x + y == x_position + y_position ||
        x - y == x_position - y_position)
  end
end
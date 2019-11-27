class King < Piece
  def valid_move?(x, y)
    super(x, y) &&
      (x - x_position).abs <= 1 &&
      (y - y_position).abs <= 1
  end
end
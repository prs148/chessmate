class Knight < Piece
  
  def valid_move?(x, y)
    super(x,y) &&
      [(x - x_position).abs, (y - y_position).abs].sort == [1,2]
  end
end


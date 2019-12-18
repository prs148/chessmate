class Pawn < Piece 

  def valid_move?(x, y)
    super(x, y) &&
      (valid_jump_move?(x, y) || 
        valid_step_move?(x, y) || 
        valid_diagonal_move?(x, y))
  end

  def valid_step_move?(x, y)
    if (x == nil or y == nil or y_position == nil or x_position == nil)
      self.errors.add(:missing_coord_valid_step_move, "Missing either x #{x} or #{y}")
      return false
    end
    y - y_position == dir && x == x_position
  end

  def valid_jump_move?(x, y)
    (y_position == 1 || y_position == 6) &&
      y - y_position == 2 * dir &&
      x == x_position

  end

  def valid_diagonal_move?(x, y)
    if (x == nil or y == nil or y_position == nil or x_position == nil)
      self.errors.add(:missing_coord_valid_diagnoal_move, "Missing either x #{x} or #{y}")
      return false
    end
    y - y_position == dir &&
      (x - x_position).abs == 1 &&
      game.piece_at(x, y) 
  end

  def dir
    (color == 'white') ? 1 : -1
  end
end


class Pawn < Piece
attr_accessor: first_move
piece_type = pawn
  
  def is_valid_move?(x, y)
    valid_direction?(x, y) && !is_obstructed?(x, y) 
  end

  def valid_direction?(x, y)
    if !@first_move && ((y == 2 || y == 1) && x = 0)
      @first_move = true
      return true
    elsif @first_move && (y == 1 && x == 0)
      return true 
    else 
      return false
    end
  end

end
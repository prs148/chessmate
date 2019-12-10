class Pawn < Piece 

def valid_move?(x, y)
  super(x, y)
    if ((y_position == 1 || y_position == 6) && (y - y_position).abs <= 2 && x == 0)
      return true
    elsif ((y - y_position).abs == 1 && x == 0)
      return true 
    else
      return false
    end
  end
end


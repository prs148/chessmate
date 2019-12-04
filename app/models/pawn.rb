class Pawn < Piece 


attr_accessor: first_move



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



#   def valid_move?(x, y)
#     super(x,y)
#       if @first_move && ((y == 2 || y == 1) && x = 0)
#         @first_move = true
#         return true
#       elsif !@first_move && (y == 1 && x == 0)
#         return true 
#       else 
#         return false
#       end
#     end
# end

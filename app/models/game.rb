class Game < ApplicationRecord
  belongs_to :user
  has_many :pieces
  
  def is_obstructed? (x1,y1,x2,y2)
    x_diff = x1 - x2
    y_diff = y1 - y2
    if x_diff != 0 && y_diff != 0 && x_diff.abs != y_diff.abs
      raise "Illegal arguements"
    end
    if x2 > x1 
      x_inc = 1
    elsif x2 < x1
      x_inc = -1
    else 
      x_inc = 0
    end
    if y2 > y1 
      y_inc = 1
    elsif y2 < y1
      y_inc = -1
    else 
      y_inc = 0
    end
    x1 += x_inc
    y1 += y_inc
    until x1 == x2 && y1 == y2
      unless Piece.where(["x_position = ? and y_position = ? and game_id = ?", x1, y1, self.id]).empty?
        return true
      end
      x1 += x_inc
      y1 += y_inc
    end
    false
  end
end

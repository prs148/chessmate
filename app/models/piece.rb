class Piece < ApplicationRecord
  belongs_to :game

  def is_obstructed? (x,y)
    check_valid_cord?(x,y)

    x_inc = inc(x,self.x_position)
    y_inc = inc(y,self.y_position)
    x += x_inc
    y += y_inc
    byebug
    until x == self.x_position && y == self.y_position
      unless Piece.where(["x_position = ? and y_position = ? and game_id = ?", x, y, self.id]).empty?
        return true
      end
      x += x_inc
      y += y_inc
    end
    false
  end

  def is_vertical_obstructed? (x,y)
    # x = 1 and self.x_position = 1
    # y = 5 and self.y_position = 1
    (self.y_position + 1..y - 1).each do |i|
      return true if Piece.where(["x_position = ? and y_position = ? and game_id = ?", x, y, self.id])
    end
  end

  def is_horizontal_obstructed? (x,y)
  end

  def is_diagonal_obstructed? (x,y) 
  end

  def inc (start,dest)
    if dest > start 
      incr = 1
    elsif dest < start
      incr = -1
    else 
      incr = 0
    end
  end

  def check_valid_cord?(x,y)
    x_diff = self.x_position - x
    y_diff = self.y_position - y
    if x_diff != 0 && y_diff != 0 && x_diff.abs != y_diff.abs
      raise "Illegal arguements"
    end
  end
end

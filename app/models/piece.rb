class Piece < ApplicationRecord
  belongs_to :game


class ChessPiece
  attr_accessor: :x, :y, :game
  def initialize(x, y, game)
    @x = x
    @y = y
    @game = game
  end
  
  def move(x, y)
    if is_valid_move?(x, y)
      return true
    else
      return false 
    end
  end
  
  def is_valid_move?(x, y)
  end

  def valid_direction?(x, y)
  end

  def is_obstructed?(x, y)  
  end
end







def is_obstructed? (x,y)
  check_valid_cord?(x,y)
  return is_vertical_obstructed?(y) if x == self.x_position
  return is_horizontal_obstructed?(x) if y == self.y_position
  is_diagonal_obstructed?(x,y)
end

def check_valid_cord?(x,y)
  x_diff = self.x_position - x
  y_diff = self.y_position - y
  if x_diff != 0 && y_diff != 0 && x_diff.abs != y_diff.abs
    raise "Illegal arguements"
  end
end

def is_vertical_obstructed? (y)
  y_inc = inc(y,self.y_position)
  y += y_inc
  until y == self.y_position
    unless game.pieces.where(x_position: self.x_position, y_position: y).empty?
      return true
    end
    y += y_inc
  end
  false
end

def is_horizontal_obstructed? (x)
  x_inc = inc(x,self.x_position)
  x += x_inc
  until x == self.x_position
    unless game.pieces.where(x_position: x, y_position: self.y_position).empty?
      return true
    end
    x += x_inc
  end
  false
end

def is_diagonal_obstructed? (x,y) 
  x_inc = inc(x,self.x_position)
  y_inc = inc(y,self.y_position)
  x += x_inc
  y += y_inc
  until x == self.x_position && y == self.y_position
    unless game.pieces.where(x_position: x, y_position: y).empty?
      return true
    end
    x += x_inc
    y += y_inc
  end
  false
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


end

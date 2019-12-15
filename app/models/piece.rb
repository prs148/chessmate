class Piece < ApplicationRecord
  belongs_to :game
  self.inheritance_column = 'piece_type'
  
  def valid_move?(x, y)
    on_board?(x, y) &&
      game.piece_at(x, y)&.color != self.color &&
      !is_obstructed?(x, y) &&
      !would_be_in_check?(x, y)
  end


  def would_be_in_check?(x, y)
    target = game.piece_at(x, y)
    return false if target&.piece_type == "King"

    previous_attrs = attributes
    previous_target_attrs = target&.attributes

    begin 
      update_attributes(x_position: x, y_position: y)
      target&.update_attributes(x_position: nil, y_position: nil)
      return game.check?(color)
    ensure
      update_attributes(previous_attrs)
      target&.update_attributes(previous_target_attrs)
    end

  end
  
  # king = pieces.where(piece_type: "King", color: color).take
  #   pieces.where(color: opposing_color(color)).any? do |p|
  #     p.valid_move?(king.x_position, king.y_position)


  def on_board?(x, y)
    x >= 0 && y >= 0 && x < 8 && y < 8
  end


  def is_obstructed?(x,y)
    return false unless is_valid_cord_for_obstruction?(x,y)
    return is_vertical_obstructed?(y) if x == self.x_position
    return is_horizontal_obstructed?(x) if y == self.y_position
    is_diagonal_obstructed?(x,y)
  end

  def is_valid_cord_for_obstruction?(x,y)
    x_diff = self.x_position - x
    y_diff = self.y_position - y
    return x_diff == 0 || y_diff == 0 || x_diff.abs == y_diff.abs    
  end

  def is_vertical_obstructed?(y)
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

  def is_horizontal_obstructed?(x)
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

  def is_diagonal_obstructed?(x,y) 
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

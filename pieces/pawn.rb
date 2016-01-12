require_relative 'piece'

class Pawn < Piece
  attr_reader :initial_position
  attr_accessor :directions

  def initialize(color, position, board)
    super(color, position, board)
    @initial_position = position
    @directions = [[1,-1],[1,0],[1,1],[2,0]] if color == :black
    @directions = [[-1,-1],[-1,0],[-1,1],[-2,0]] if color == :white
  end

  def to_s
    return ' ♙  ' if color == :white
    return ' ♟  '
  end

  def moves
    output = []
    move_one = false
    @directions = @directions.take(3) if position != @initial_position
    directions.each_index do |index|
      possible_position = [position[0] + directions[index][0],position[1] + directions[index][1]]
      if index.even?
        unless out_of_bounds?(possible_position)
          if occupied?(possible_position)
            output << possible_position unless board[possible_position].color == board[position].color
          end
        end
      elsif index == 1
        unless out_of_bounds?(possible_position)
          unless occupied?(possible_position)
            output << possible_position
            move_one = true
          end
        end
      else
        unless out_of_bounds?(possible_position)
          unless occupied?(possible_position)
            output << possible_position if move_one
          end
        end
      end
    end
    output
  end

  def out_of_bounds?(pos)
    return true if pos[0] < 0 || pos[0] > 7
    return true if pos[1] < 0 || pos[1] > 7
    false
  end

  def occupied?(pos)
    return true unless board[pos].color.nil?
    false
  end
end

require_relative 'stepping_piece'

class King < SteppingPiece
  attr_accessor :moved
  attr_reader :directions

  def initialize(color, position, board)
    super(color, position, board)
    @directions = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
    @moved = false
  end

#remove method if castle implementation doesn't work, also remove instance
#variables moved in the King and Rook class, and updating them in board class
  def moves
    output = super
    unless moved
      output << [position[0],position[1]-2] if check_castle_left?
      output << [position[0],position[1]+2] if check_castle_right?
    end
    output
  end

  def to_s
    return ' ♚  '.colorize(color: color)
  end

  def check_castle_left?
    return false unless board[[position[0], 0]].is_a?(Rook)
    return false if board[[position[0], 0]].moved
    column_index = 1
    while column_index < position[1]
      return false if occupied?([position[0], column_index])
      if column_index > 1
        return false unless valid_castle?(position, [position[0], column_index])
      end
      column_index += 1
    end
    true
  end

  def check_castle_right?
    return false unless board[[position[0], 7]].is_a?(Rook)
    return false if board[[position[0], 7]].moved
    column_index = 6
    while column_index > position[1]
      return false if occupied?([position[0], column_index])
      return false unless valid_castle?(position, [position[0], column_index])
      column_index -= 1
    end
    true
  end

  def valid_castle?(start, end_pos)
    new_board = @board.dup
    color = new_board[start].color
    new_board.move!(start, end_pos)
    !new_board.in_check?(color)
  end

end

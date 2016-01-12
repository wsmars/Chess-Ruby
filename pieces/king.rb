require_relative 'stepping_piece'

class King < SteppingPiece
  attr_reader :directions

  def initialize(color, position, board)
    super(color, position, board)
    @directions = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
  end

  def to_s
    return ' ♚  '.colorize(color: color)
  end
end

require_relative 'stepping_piece'

class Knight < SteppingPiece
  attr_reader :directions

  def initialize(color, position, board)
    super(color, position, board)
    @directions = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]
  end


  def to_s
    return ' ♘  ' if color == :white
    return ' ♞  '
  end

end

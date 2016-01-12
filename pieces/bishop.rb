require_relative 'sliding_piece'

class Bishop < SlidingPiece
  attr_reader :directions

  def initialize(color, position, board)
    super(color, position, board)
    @directions = [:NW, :NE, :SW, :SE]
  end

  def to_s
    return ' ♝  '.colorize(color: color)
  end
end

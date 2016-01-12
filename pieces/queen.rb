require_relative 'sliding_piece'

class Queen < SlidingPiece
  attr_reader :directions

  def initialize(color, position, board)
    super(color, position, board)
    @directions = [:N, :S, :E, :W, :NW, :NE, :SW, :SE]
  end

  def to_s
    return ' ♛  '.colorize(color: color)
  end
end

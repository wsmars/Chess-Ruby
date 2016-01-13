require_relative 'sliding_piece'

class Rook < SlidingPiece
  attr_accessor :moved
  attr_reader :directions

  def initialize(color, position, board)
    super(color, position, board)
    @directions = [:N, :S, :E, :W]
    @moved = false
  end

  def to_s
    return ' ♜  '.colorize(color: color)
  end
end

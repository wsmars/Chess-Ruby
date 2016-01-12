require_relative 'sliding_piece'

class Rook < SlidingPiece
  attr_reader :directions

  def initialize(color, position, board)
    super(color, position, board)
    @directions = [:N, :S, :E, :W]
  end

  def to_s
    return '♖' if color == :white
    return '♜'
  end
end

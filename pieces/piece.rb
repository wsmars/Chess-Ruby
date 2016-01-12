class Piece
  attr_accessor :position, :color

  def initialize(color = nil, position = nil, board = nil)
    @color = color
    @position = position
    @board = board
  end

  def to_s
    ' '
  end

  def moves
  end
end

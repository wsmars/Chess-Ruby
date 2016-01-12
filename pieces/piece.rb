class Piece
  attr_accessor :position, :color, :board

  def initialize(color = nil, position = nil, board = nil)
    @color = color
    @position = position
    @board = board
  end

  def to_s
    '    '
  end

  def moves
    raise "no piece error"
  end
end

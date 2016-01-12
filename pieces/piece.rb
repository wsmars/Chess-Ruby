class Piece
  attr_accessor :position, :color, :board

  def initialize(color = nil, position = nil, board = nil)
    @color = color
    @position = position
    @board = board
  end

  def dup(new_board = nil)
    self.class.new(color = @color, position = @position, board = new_board)
  end

  def to_s
    '    '
  end

  def moves
    raise "no piece error"
  end
end

class Piece
  attr_accessor :position, :color, :board

  def initialize(color = nil, position = nil, board = nil)
    @color = color
    @position = position
    @board = board
  end

  def valid_move?(start_pos, end_pos)
    new_board = @board.dup
    color = new_board[start_pos].color
    new_board.move(start_pos, end_pos)
    !new_board.in_check?(color)
  end

  def valid_moves
    self.moves.select { |move| valid_move?(@position, move) }
  end

  def dup(new_board = nil)
    self.class.new(color = @color, position = @position, board = new_board)
  end

  def to_s
    '    '
  end

  def moves
    raise "NoPieceError"
  end
end

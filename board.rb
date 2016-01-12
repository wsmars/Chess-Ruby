require 'colorize'
require_relative 'pieces_helper'

class Board
  attr_accessor :grid

  def initialize(fill = true)
    @grid = Array.new(8) { Array.new(8, Piece.new) }
    # self[[0,0]] = Queen.new(:black, [0,0], self)
    # self[[6,0]] = King.new(:white, [6,0], self)
    # self[[3,0]] = King.new(:black, [3,0], self)
    if fill
      populate_grid
    end
  end

  def populate_grid
    (0..7).to_a.each do |row|
      color = :black if [0,1].include?(row)
      color = :white if [6,7].include?(row)

      (0..7).to_a.each do |col|
        #pawn
        self[[row, col]] = Pawn.new(color, [row, col], self) if [1,6].include?(row)

        #rook
        self[[row, col]] = Rook.new(color, [row, col], self) if [[0,0],[0,7],[7,0],[7,7]].include?([row,col])

        #knight
        self[[row, col]] = Knight.new(color, [row, col], self) if [[0,1],[0,6],[7,1],[7,6]].include?([row,col])

        #bishop
        self[[row, col]] = Bishop.new(color, [row, col], self) if [[0,2],[0,5],[7,2],[7,5]].include?([row,col])

        #queen
        self[[row, col]] = Queen.new(color, [row, col], self) if [[0,3],[7,3]].include?([row,col])

        #king
        self[[row, col]] = King.new(color, [row, col], self) if [[0,4],[7,4]].include?([row,col])
      end
    end
  end

  def in_check?(color)
    #find king
    king_position = @grid.flatten.select {|king| king.is_a?(King) && king.color == color}[0].position

    #loop through other color's pieces and see if king falls in their moves
    other_color = color == :black ? :white : :black
    all_pieces(other_color).any? do |piece|
      piece.moves.include?(king_position)
    end
  end

  def checkmate?(color)
    return false unless in_check?(color)
    all_pieces(color).all? do |piece|
      piece.valid_moves.length == 0
    end
  end

  def dup
    new_board = Board.new(false)
    new_board.grid.each_index do |row|
      new_board.grid[row].each_index do |col|
        new_board[[row,col]] = self[[row,col]].dup(new_board)
      end
    end
    new_board
  end

  def all_pieces(color)
    @grid.flatten.select {|piece| piece.color == color}
  end

  def move(start, end_pos, color)
    #re-write after implementing Display
    raise "NilPieceError" if self[start].position.nil?
    raise "WrongColorPieceError" unless self[start].color == color
    raise "InvalidMoveError" unless self[start].valid_moves.include?(end_pos)
    self.move!(start, end_pos)
  end

  def move!(start, end_pos)
    self[end_pos] = self[start]
    self[end_pos].position = end_pos
    self[start] = Piece.new
  end

  def [](pos)
    row = pos[0]
    col = pos[1]
    @grid[row][col]
  end

  def []=(pos, value)
    row = pos[0]
    col = pos[1]
    @grid[row][col] = value
  end

  def in_bounds?(pos)
    (0..7).include?(pos[0]) && (0..7).include?(pos[1])
  end

end

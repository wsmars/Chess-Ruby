require 'colorize'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, Piece.new(' ')) }
    populate_grid
  end

  def populate_grid
    (0..7).to_a.each do |row|
      (0..7).to_a.each do |col|
        # color = :black if [0,1].include?(row)
        # color = :white if [6,7].include?(row)

        #pawn
        self[[row, col]] = Piece.new('P') if [1,6].include?(row)

        #rook
        self[[row, col]] = Piece.new('R') if [[0,0],[0,7],[7,0],[7,7]].include?([row,col])

        #knight
        self[[row, col]] = Piece.new('N') if [[0,1],[0,6],[7,1],[7,6]].include?([row,col])

        #bishop
        self[[row, col]] = Piece.new('B') if [[0,2],[0,5],[7,2],[7,5]].include?([row,col])

        #queen
        self[[row, col]] = Piece.new('Q') if [[0,3],[7,3]].include?([row,col])

        #king
        self[[row, col]] = Piece.new('K') if [[0,4],[7,4]].include?([row,col])
      end
    end
  end

  def move(start, end_pos)
    #re-write after implementing Display
    self[end_pos] = self[start]
    self[start] = nil
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

  # def inspect
  #   @grid
  # end
end

class Piece
  def initialize(name)
    @name = name
  end

  def to_s
    @name.to_s
  end

  # def inspect
  #   @name.colorize(:red)
  # end
end

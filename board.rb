require 'colorize'
require_relative 'pieces_helper'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, Piece.new) }
    populate_grid
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

end

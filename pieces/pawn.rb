require_relative 'piece'

class Pawn < Piece
  def to_s
    return '♙' if color == :white
    return '♟'
  end

  def moves

  end
end

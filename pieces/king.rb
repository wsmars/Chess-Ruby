require_relative 'piece'

class King < Piece
  def to_s
    return '♔' if color == :white
    return '♚'
  end
end

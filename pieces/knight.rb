require_relative 'piece'

class Knight < Piece
  def to_s
    return '♘' if color == :white
    return '♞'
  end
end

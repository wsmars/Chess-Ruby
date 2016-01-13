require_relative 'piece'

class SteppingPiece < Piece

  def moves
    output = []
    directions.each do |direction|
      jump = direction
      possible_position = [position[0] + jump[0], position[1] + jump[1]]
      if @board.in_bounds?(possible_position)
        output << possible_position unless board[possible_position].color == board[position].color
      end
    end
    output
  end

end

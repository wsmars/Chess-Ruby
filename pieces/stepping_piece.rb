require_relative 'piece'

class SteppingPiece < Piece

  def moves
    output = []
    directions.each do |direction|
      jump = direction
      possible_position = [position[0] + jump[0], position[1] + jump[1]]
      unless out_of_bounds?(possible_position)
        output << possible_position unless board[possible_position].color == board[position].color
      end
    end
    output
  end

  def out_of_bounds?(pos)
    return true if pos[0] < 0 || pos[0] > 7
    return true if pos[1] < 0 || pos[1] > 7
    false
  end

end

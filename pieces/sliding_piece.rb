require_relative 'piece'

class SlidingPiece < Piece
  DIR_HASH = {:N => [-1,0],
              :S => [1,0],
              :E => [0,1],
              :W => [0,-1],
              :NW => [-1,-1],
              :NE => [-1,1],
              :SW => [1,-1],
              :SE => [1,1]}

  def moves
    output = []
    directions.each do |direction|
      jump = DIR_HASH[direction]
      possible_position = [position[0] + jump[0], position[1] + jump[1]]
      until out_of_bounds?(possible_position) || occupied?(possible_position)
        output << possible_position
        possible_position = [possible_position[0] + jump[0], possible_position[1] + jump[1]]
      end
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

  def occupied?(pos)
    return true unless board[pos].color.nil?
    false
  end
end

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

    end
  end

  def out_of_bound?(pos)

  end

  def occupied?(pos)

  end
end

require_relative 'display'

class Game
  attr_accessor :color, :display
  attr_reader :board, :players

  def initialize(players)
    @board = Board.new
    @display = Display.new(@board)
    @color = :white
    @players = players
    @current_player = players.sample
  end

  def play
    until @board.checkmate?(color)
      @display = Display.new(board)
      begin
        @board.move(*@current_player.play_turn(@color,@display))
      rescue
        puts "Please choose a valid input!"
        sleep(1)
        retry
      end
      switch!
    end
    @display = Display.new(board)
    @display.render
    puts "Game over!"
  end

  def switch!
    @color = @color == :white ? :black : :white
    @current_player = players.reject { |player| player == @current_player }.first
  end
end

class HumanPlayer
  def initialize(name = "Mingshuo")
    @name = name
  end

  def play_turn(color,display)
    display.render
    puts "#{@name} enter the position of the piece you want to move"
    start_pos = display.get_input
    puts "#{@name} enter the position where you want to move"
    end_pos = display.get_input
    [start_pos, end_pos, color]
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new([HumanPlayer.new("Pardha"), HumanPlayer.new])
  game.play
end

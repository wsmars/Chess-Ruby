require_relative 'display'

class Game
  attr_accessor :color, :display, :error_message
  attr_reader :board, :players

  def initialize(players)
    @board = Board.new
    @display = Display.new(@board)
    @color = :white
    @players = players.shuffle
    @players[0].color = :white
    @players[1].color = :black
    @current_player = @players[0]
    @error_message = ''
  end

  def play
    until @board.checkmate?(@current_player.color)
      @error_message = ''
      begin
        @display.render
        puts @error_message
        @board.move(*@current_player.play_turn(@display))
      rescue => error
        @error_message = error.message
        retry
      end
      switch!
    end
    @display.render
    puts "Game over!"
  end

  def switch!
    @current_player = players.reject { |player| player == @current_player }.first
  end
end

class HumanPlayer
  attr_accessor :color

  def initialize(name = "Mingshuo")
    @name = name
  end

  def play_turn(display)
    puts "#{@name} enter the position of the piece you want to move"
    start_pos = display.get_input
    display.selected = true if display.board[start_pos].color == @color
    display.selected_position = start_pos
    display.render
    puts "#{@name} enter the position where you want to move"
    end_pos = display.get_input
    display.selected = false
    [start_pos, end_pos, color]
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new([HumanPlayer.new("Pardha"), HumanPlayer.new])
  game.play
end

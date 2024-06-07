
require_relative 'chess_pieces'
require_relative 'board'

class ChessGame
  attr_reader :board

  def initialize
    @board = Board.new
    @game_over = false
  end

  def play
    loop do
      puts "White please enter your move in chess notation"
      white = gets.chomp
      @game_over = true if white == 'game_over'
      break if @game_over == true

      board.move_reader(:white, white) unless board.check(:white)
      board.show_board(:black)

      puts "Black please enter your move in chess notation"
      black = gets.chomp
      @game_over = true if black == 'game_over'

      board.move_reader(:black, black) unless board.check(:black)
      board.show_board(:white)
      break if @game_over == true
    end
  end

end

game = ChessGame.new
game.play


require_relative 'chess_pieces'
require_relative 'board'

class ChessGame
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def play
    loop do
    end
  end

end

game = ChessGame.new
game.board.show_board('black')
game.board.show_board('white')

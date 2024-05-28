
require_relative 'chess_pieces'
require_relative 'board'

class ChessGame
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def show_board
    @board.rows.each do |row|
      puts row.join("|")
    end
  end
end

game = ChessGame.new
game.show_board

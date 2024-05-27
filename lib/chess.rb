
require_relative 'chess_pieces'
require_relative 'board'

class ChessGame
  attr_reader :board

  def initialize
    @board = Board.new

    (0...8).each do |x|
      @board.set(x,1, Piece.new( :black, :pawn ))
      @board.set(x,6, Piece.new( :white, :pawn ))
    end

    @board.set(1,0, Piece.new( :black, :knight ))
    @board.set(2,0, Piece.new( :black, :bishop ))
    @board.set(0,0, Piece.new( :black, :rook ))
    @board.set(3,0, Piece.new( :black, :queen ))
    @board.set(4,0, Piece.new( :black, :king ))
    @board.set(5,0, Piece.new( :black, :bishop ))
    @board.set(6,0, Piece.new( :black, :knight ))
    @board.set(7,0, Piece.new( :black, :rook ))

    @board.set(0,7, Piece.new( :white, :rook ))
    @board.set(1,7, Piece.new( :white, :knight ))
    @board.set(2,7, Piece.new( :white, :bishop ))
    @board.set(3,7, Piece.new( :white, :queen ))
    @board.set(4,7, Piece.new( :white, :king ))
    @board.set(5,7, Piece.new( :white, :bishop ))
    @board.set(6,7, Piece.new( :white, :knight ))
    @board.set(7,7, Piece.new( :white, :rook ))
  end

  def show_board
    @board.each do |row|
      puts row.join("|")
    end
  end
end

game = ChessGame.new
game.show_board

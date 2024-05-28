
require_relative 'chess_pieces'

class Board
  attr_accessor :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) { "" } }
    (0...8).each do |x|
      @rows[x][1] = Piece.new(:black, :pawn)
      @rows[x][6] = Piece.new(:white, :pawn)
    end

    @rows[0][0] = Piece.new(:black, :rook)
    @rows[1][0] = Piece.new(:black, :knight)
    @rows[2][0] = Piece.new(:black, :bishop)
    @rows[3][0] = Piece.new(:black, :queen)
    @rows[4][0] = Piece.new(:black, :king)
    @rows[5][0] = Piece.new(:black, :bishop)
    @rows[6][0] = Piece.new(:black, :knight)
    @rows[7][0] = Piece.new(:black, :rook)

    @rows[0][7] = Piece.new(:white, :rook)
    @rows[1][7] = Piece.new(:white, :knight)
    @rows[2][7] = Piece.new(:white, :bishop)
    @rows[3][7] = Piece.new(:white, :queen)
    @rows[4][7] = Piece.new(:white, :king)
    @rows[5][7] = Piece.new(:white, :bishop)
    @rows[6][7] = Piece.new(:white, :knight)
    @rows[7][7] = Piece.new(:white, :rook)
  end

  def get(x, y)
    @rows[x][y]
  end

  def set(x, y, piece)
    @rows[x][y] = piece
  end

  def promotion_piece(piece)
    @promotion_piece = piece
  end

  def show_board
    @rows.each do |row|
      puts row.map { |piece| piece == "" ? " " : piece.symbol }.join("|")
    end
  end
end

board = Board.new
board.show_board

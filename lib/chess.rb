class ChessGame
  attr_reader :board

  def initialize
    @board = Board.new(8,8)
    @board.promotion_piece = :queen

    (0...8).each do |x|
      @board[x,1] = Piece.new( :black, :pawn )
      @board[x,6] = Piece.new( :white, :pawn )
    end

    @board[0,0] = Piece.new( :black, :rook )
    @board[1,0] = Piece.new( :black, :knight )
    @board[2,0] = Piece.new( :black, :bishop )
    @board[3,0] = Piece.new( :black, :queen )
    @board[4,0] = Piece.new( :black, :king )
    @board[5,0] = Piece.new( :black, :bishop )
    @board[6,0] = Piece.new( :black, :knight )
    @board[7,0] = Piece.new( :black, :rook )

    @board[0,7] = Piece.new( :white, :rook )
    @board[1,7] = Piece.new( :white, :knight )
    @board[2,7] = Piece.new( :white, :bishop )
    @board[3,7] = Piece.new( :white, :queen )
    @board[4,7] = Piece.new( :white, :king )
    @board[5,7] = Piece.new( :white, :bishop )
    @board[6,7] = Piece.new( :white, :knight )
    @board[7,7] = Piece.new( :white, :rook )
  end
end

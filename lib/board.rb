
require_relative 'chess_pieces'

FILES = ['a','b','c','d','e','f','g','h']

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
    x = FILES.find_index(x) if x.is_a?(String)
    @rows[x][y]
  end

  def set(x, y, piece)
    x = FILES.find_index(x) if x.is_a?(String)
    @rows[x][y] = piece
  end

  def promotion_piece(piece)
    @promotion_piece = piece
  end

  def show_board(color)
    case color
      when 'white'
        @rows.each do |row|
          puts row.map { |piece| piece == "" ? " " : piece.symbol }.join(" ")
        end
      when 'black'
        @rows.transpose.each do |row|
          puts row.map { |piece| piece == "" ? " ": piece.symbol }.join(" ")
        end
      end
  end

  def isoccupied?(x, y)
    get(x,y) != "" ? true : false
  end

  def find(color, piece)
    if color == 'white'
      case piece
      when 'pawn'then symbol = "\u2659"
      when 'rook' then symbol = "\u2656"
      when 'knight' then symbol = "\u2658"
      when 'bishop' then symbol = "\u2657"
      when 'king' then symbol = "\u2654"
      when 'queen' then symbol = "\u2655"
      end
    elsif color == 'black'
      case piece
      when 'pawn'then symbol = "\u265F"
      when 'rook' then symbol = "\u265C"
      when 'knight' then symbol = "\u265E"
      when 'bishop' then symbol = "\u265D"
      when 'king' then symbol = "\u265A"
      when 'queen' then symbol = "\u265B"
      end
    end
    list = []
    @rows.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        if cell.is_a?(Piece) && cell.symbol == symbol
        list << [row_index, col_index]
        end
      end
    end
    list
  end

  def islegal?(color, move)
  end

  def move(color, move)
    piece = move.length == 3? move.first : 'pawn'
    x, y = move[-2], move[-1]
    if move == move.downcase
      puts please enter a valid move
      new_move = gets.chomp
      move(color,new_move)
    else
      case piece
      when 'K'
        then
      when 'B'
        then
      when 'R'
        then
      when 'Q'
        then
      when 'N'
        then set(x,y, knight)
      when 'pawn'
        then
      end
    end
  end
end


require_relative 'chess_pieces'

FILES = ['a','b','c','d','e','f','g','h']

class Board
  attr_accessor :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) { "" } }
    (0...8).each do |x|
      @rows[x][6] = Pawn.new(:white)
      @rows[x][1] = Pawn.new(:black)
    end

    @rows[7][0] = Rook.new(:black)  # Swapped rows for black pieces
    @rows[6][0] = Knight.new(:black)
    @rows[5][0] = Bishop.new(:black)
    @rows[4][0] = Queen.new(:black)
    @rows[3][0] = King.new(:black)
    @rows[2][0] = Bishop.new(:black)
    @rows[1][0] = Knight.new(:black)
    @rows[0][0] = Rook.new(:black)

    @rows[7][7] = Rook.new(:white)
    @rows[6][7] = Knight.new(:white)
    @rows[5][7] = Bishop.new(:white)
    @rows[4][7] = Queen.new(:white)
    @rows[3][7] = King.new(:white)
    @rows[2][7] = Bishop.new(:white)
    @rows[1][7] = Knight.new(:white)
    @rows[0][7] = Rook.new(:white)
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
      when :white
        @rows.transpose.each do |row|
          puts row.map { |piece| piece == "" ? " " : piece.uni }.join(" ")
        end
      when :black
        @rows.transpose.each do |row|
          puts row.map { |piece| piece == "" ? " ": piece.uni }.join(" ")
        end
      end
  end

  def isoccupied?(x, y)
    get(x,y) != "" ? true : false
  end

  def find(color, piece)
    if color == :black
      case piece
      when 'pawn'then unicode = "\u2659"
      when 'rook' then unicode = "\u2656"
      when 'knight' then unicode = "\u2658"
      when 'bishop' then unicode = "\u2657"
      when 'king' then unicode = "\u2654"
      when 'queen' then unicode = "\u2655"
      end
    elsif color == :white
      case piece
      when 'pawn'then unicode = "\u265F"
      when 'rook' then unicode = "\u265C"
      when 'knight' then unicode = "\u265E"
      when 'bishop' then unicode = "\u265D"
      when 'king' then unicode = "\u265A"
      when 'queen' then unicode = "\u265B"
      end
    end
    list = []
    @rows.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        next if cell == ""
        if  cell.uni == unicode
          list << [row_index, col_index]
        end
      end
    end
    p list
  end

  def islegal?(color, move)
  end

  def clear(x, y)
    @rows[x][y] = ""
  end

  def move(color, move)
    piece = move.length == 3? move[0] : 'pawn'
    x, y = move[-2], move[-1].to_i
    x = FILES.find_index(x) if x.is_a?(String)
    y -= 1
    puts x, y
    if move == move.downcase
      puts please enter a valid move
      new_move = gets.chomp
      return move(color,new_move)
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
        then
        knights = find(color, 'knight')
        knights.each do |knight_pos|
          j , k = knight_pos
          p [j,k]
          knight = get(j,k)
          knight.moves.each do |move, coordinates|
            a,b = coordinates
            if [a+j,  k+b] == [x, y]
              set(x, y, knight)
              clear(j,k)
              return true
            end
          end
        end

      when 'pawn'
        then
        pawns = find(color, 'pawn')
        pawns.each_with_index do |pawn, index|
          j , k = pawn[0], pawn[1]
            if k == 1 || k == 6
              Pawn.moves.each do |move|
                a,b = move[0], move[1]
                if [a+j,  k+b] == [x, y]
                  chosen_pawn = pawn[index]
                  chosen_pawn_x = pawn[index][0]
                  chosen_pawn_y = pawn[index][1]
                end
              end
            elsif get((j+1),(k+1)).color != color || get((j-1),(k+1)) != color
              Pawn.capture_moves.each do |move|
                a, b = move[0], [1]
                if [a+j,  k+b] == [x, y]
                  chosen_pawn = pawn[index]
                  chosen_pawn_x = pawn[index][0]
                  chosen_pawn_y = pawn[index][1]
                end
              end
            else
              a,b = Pawn.moves[:up][0], Pawn.moves[:up][1]
              if [a+j,  k+b] == [x, y]
                chosen_pawn = pawn[index]
                chosen_pawn_x = pawn[index][0]
                chosen_pawn_y = pawn[index][1]
            end
          end
        end
        pawn = find(chosen_pawn_x, chosen_pawn_y)
        set(x, y, pawn)
        clear(chosen_pawn_x, chosen_pawn_y)
      end
    end
    puts "Invalid Move"
    false
  end
end

board = Board.new
board.move(:white,'Nf3')
board.move(:black, 'Nf6')
board.move(:white, 'Nc3')
board.move(:black, 'Nc6')
#p board.find(:white, 'knight')
#board.clear(1,7)
board.show_board(:white)

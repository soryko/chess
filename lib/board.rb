
require_relative 'chess_pieces'

FILES = ['a','b','c','d','e','f','g','h'].reverse!

class Board
  attr_accessor :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) { "" } }
    (0...8).each do |x|
      @rows[x][6] = Pawn.new(:white)
      @rows[x][1] = Pawn.new(:black)
    end

    @rows[7][0] = Rook.new(:black)
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
    piece = @rows[x][y] != "" ? @rows[x][y] : nil
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
    list
  end

  def islegal?(color, move)
  end

  def clear(x, y)
    @rows[x][y] = ""
  end

  def knight_move(color, x, y)
    knights = find(color, 'knight')
    knights.each do |knight_pos|
      j , k = knight_pos
      #p [j,k]
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
    puts "Invalid Move"
    false
  end

  def pawn_move(color,destination, x, y)
    pawns = find(color, 'pawn')
    pawns.each_with_index do |pawn_pos, index|
      j , k = pawn_pos
      pawn = get(j,k)
        if j == x && (k == 1 || k == 6)
          pawn.moves.each do |move, coordinates|
            a,b = coordinates
            if color == :white
              if [a+j,  k+b] == [x, y]
                set(x, y, pawn)
                clear(j, k)
                return true
              end
            elsif color == :black
              if [ a + j, k - b] == [x, y]
                set(x, y, pawn)
                clear(j,k)
                return true
              end
            end
          end
        elsif destination.include?("x")
          diag1 = j+1, k+1
          diag2 = j-1, k+1
          if get(diag1).color != color || get(diag2).color != color
            Pawn.capture_moves.each do |move|
              a, b = move[0], [1]
              if [a+j,  k+b] == [x, y]
                set(x, y, pawn)
                clear(j, k)
                return true
              end
            end
          end
        else
          a = 0
          b = color == :white ? 1 : -1
          if [a+j,  k+b] == [x, y]
            set(x, y, pawn)
            clear(j, k)
            return true
        end
      end
    end
    puts "Invalid Move"
    false
  end

  def bishop_move(color, x, y)
    bishops = find(color, 'bishop')
    bishops.each do |bishop_pos|
      j, k = bishop_pos
      bishop = get(j,k)
      diag1 = Bishop.moves[:updiagonal].map { |dx, dy| [dx + j, dy += k]}
      diag2 = Bishop.moves[:downdiagonal].map { |dx, dy| [dx+ j, dy += k]}

      if diag1.include?([x, y]) || diag2.include?([x,y])
        set(x, y, bishop)
        clear(j, k)
        return true
      end
    end
    puts "Invalid Move"
    false
  end

  def rook_move(color, x, y)
    rooks = find(color, 'rook')
    rooks.each do |rook_pos|
      j, k = rook_pos
      rook = get(j, k)
      if x == j || y == k
        if path_clear?(j, k, x, y)
          set(x, y, rook)
          clear(j, k)
          return true
        end
      end
    end
    puts "Invalid Move"
    false
  end

  def queen_move(color, x, y)
    queen_pos = find(color, 'queen')
    j, k = queen_pos.first
    queen = get(j,k)
    if x == j || y == k
      if path_clear?(j, k, x, y)
        set(x, y, queen)
        clear(j, k)
        return true
      end
    elsif (x - j)**2 == (y-k)**2
      if path_clear?(j, k, x, y)
        set(x, y, queen)
        clear(j, k)
        return true
      end
    end
    puts "Invalid Move"
    false
  end


  def path_clear?(j, k, x, y)
    if j == x  # Vertical move
      y_increments = k < y ? 1 : -1
      (k + y_increments).step(y - y_increments, y_increments).each do |step_y|
        return false unless get(j, step_y).nil?
      end
    elsif k == y
      x_increments = j < x ? 1 : -1
      (j + x_increments).step(x - x_increments, x_increments).each do |step_x|
        return false unless get(step_x, k).nil?
      end
    elsif (j - x)**2 == (k - y)**2
      x_increments = (x > j) ? 1 : -1
      y_increments = (y > k) ? 1 : -1
      step_x, step_y = j + x_increments, k + y_increments
      while step_x != x && step_y != y
        return false unless get(step_x, step_y).nil?
        step_x += x_increments
        step_y += y_increments
      end
    else
      return false
    end
    true
  end

  def move_reader(color, destination)
    piece = destination.length == 3? destination[0] : 'P'
    x, y = destination[-2], destination[-1].to_i
    x = FILES.find_index(x) if x.is_a?(String)
    y -= 1
    if destination == destination.downcase
      puts please enter a valid move
      new_move = gets.chomp
      return move_reader(color,new_move)
    end
    case piece
    when 'K'
      then
    when 'B' then return bishop_move(color, x, y)
    when 'R' then return rook_move(color, x, y)
    when 'Q' then return queen_move(color, x, y)
    when 'N' then return knight_move(color, x, y)
    when 'P' then return pawn_move(color, destination, x, y)
    end
    false
  end
end

board = Board.new
board.move_reader(:white,'Nf3')
board.move_reader(:black, 'Nf6')
board.move_reader(:white, 'Nc3')
board.move_reader(:black, 'Nc6')
board.move_reader(:white, 'Pe4')
board.move_reader(:black, 'Pe5')
board.move_reader(:white, 'Bb5')
board.move_reader(:black, 'Pd5')
board.move_reader(:white, 'Pa3')
board.move_reader(:black, 'Bg4')
board.move_reader(:white, 'Rf1')
board.move_reader(:black, 'Qd6')
board.show_board(:white)

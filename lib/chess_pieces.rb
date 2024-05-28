PIECES_UNI = {
  :pawn => {:white => "\u2659", :black => "\u265F"},
  :rook => {:white => "\u2656", :black => "\u265C"},
  :knight => {:white => "\u2658", :black => "\u265E"},
  :bishop => {:white => "\u2657", :black => "\u265D"},
  :king => {:white => "\u2654", :black => "\u265A"},
  :queen => {:white => "\u2655", :black => "\u265B"}
}

class Piece
  attr_reader :color, :piece, :symbol

  def initialize(color, piece)
    @symbol = PIECES_UNI[piece][color]
  end
end

class Pawn < Piece
  attr_reader :moves

  def initialize(color)
    super(color, :pawn)

    @moves = {
      up: [0, 1],
      upup: [0, 2],
      capture_left: [-1, 1],
      capture_right: [1, 1]
    }
  end
end

class Rook < Piece
  attr_reader :moves

  def initialize(color)
    super(color, :pawn)

    @moves = {
      horizontal: [8, 0],
      vertical: [0, 8]
    }
  end
end

class Knight < Piece
  attr_reader :moves

  def initialize(color)
    super(color, :Knight)

    @moves = {
      southW: [1, -2],
      southE: [-1, -2],
      northW: [1, 2],
      northE: [-1, 2],
      westN: [2, 1],
      westS: [2, -1],
      eastN: [-2, 1],
      eastS: [-2, -1]
    }
  end
end

class Bishop < Piece
  attr_reader :moves

  def initialize(color)
    super(color, :Bishop)

    @moves = {
      updiagonal: updiagonal(),
      downdiagonal: downdiagonal()
    }
  end

  def updiagonal
    coordinates = []
    (-8..8).each do |x|
      (-8..8).each do |y|
        next unless (x + y) >= 0
        coordinates << [x, y]
      end
    end
    coordinates
  end

  def downdiagonal
    coordinates = []
    (-8..8).each do |x|
      (8..-8).each do |y|
        next unless (x + y) <= 0
        coordinates << [x, y]
      end
    end
    coordinates
  end
end

class King < Piece
  attr_reader :moves

  def initialize(color)
    super(color, :king)

    @moves = {
      north: [0, 1],
      northE: [-1, 1],
      northW: [1, 1],
      east: [-1, 0],
      west: [1, 0],
      south: [0, -1],
      southE: [-1, -1],
      southW: [1, -1]
    }
  end
end

class Queen < Piece
  attr_reader :moves

  def initialize(color)
    super(color, :queen)

    @moves = {
      updiagonal: Bishop.updiagonal,
      downdiagonal: Bishop.downdiagonal,
      horizontal: Rook.horizontal,
      vertical: Rook.vertical
    }
  end
end

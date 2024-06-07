
class Piece
  attr_reader :color, :piece, :uni

  def initialize
  end
end

class Pawn < Piece
  attr_reader :moves , :uni, :color, :capture_moves

  def initialize(color)
    @color = color

    @uni = color == :white ?  "\u2659" : "\u265F"
    @moves = {
      up: [0, 1],
      upup: [0, 2],
    }
    @capture_moves = { capture_left: [-1, 1], capture_right: [1, 1]}
  end
end

class Rook < Piece
  attr_reader :moves, :uni, :color

  def initialize(color)
    @color = color

    @uni = color == :white ? "\u2656" : "\u265C"
    @moves = {
      horizontal: [8, 0],
      vertical: [0, 8]
    }
  end
end

class Knight < Piece
  attr_reader :moves, :uni, :color

  def initialize(color)
    @color = color
    @uni = color == :white ? "\u2658" : "\u265E"
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
  attr_reader :moves, :uni, :color

  def initialize(color)
    @color = color
    @uni = color == :white ? "\u2657" : "\u265D"
    @moves = self.moves
  end

  def self.moves
    {
      updiagonal: (-7..7).map { |i| [i, i] },
      downdiagonal: (-7..7).map { |i| [-i, -i]},
    }
  end
end

class King < Piece
  attr_reader :moves, :uni, :color

  def initialize(color)
    @color = color
    @uni = color == :white ? "\u2654" : "\u265A"
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
  attr_reader :moves, :uni, :color

  def initialize(color)
    @color = color

    @uni = color == :white ? "\u2655" : "\u265B"
    @moves = {
      criss_cross: Bishop.moves,
      horizontal: (7..0),
      vertical: (0..7)
    }
  end
end

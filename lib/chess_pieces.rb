class Piece
  attr_reader :color, :piece

  def initialize(:color, :piece)
    @color = :color
    @piece = :piece
  end
end

class Pawn < Piece
  attr_reader :moves

  def initialize
    moves =  { up:(0,1), upup:(0,2), capture_left:(-1,1), capture_right:(1,1) }
  end

end

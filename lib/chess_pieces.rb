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

class Rook < Piece
  attr_reader :moves

  def initialize
    moves = { horizontal:(8,0), vertical:(0,8)}
  end
end

class Knight < Piece
  attr_reader :moves

  def initialize
    moves = { southW:(1,-2), southE:(-1,-2), northW:(1,2), northE:(-1,2), westN:(2,1), westS:(2,-1), eastN:(-2,1), eastS:(-2,-1) }
  end
end

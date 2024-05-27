class Board
attr_reader :rows

  def initalize
    @rows = Array.new(7) { Array.new(7) {nil} }
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
end

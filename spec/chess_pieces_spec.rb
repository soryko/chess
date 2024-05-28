require './lib/chess_pieces'

describe Piece do
  describe '#initalize' do
    it "takes a color and piece as input and returns a unicode representation of the piece" do
      pawn = Piece.new(:white, :pawn)
      expect(pawn.symbol).to eql(♙)
    end
  end
end

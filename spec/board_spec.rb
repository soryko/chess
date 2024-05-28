require './lib/board'

describe Board do
  describe '#initialize' do
    it "returns an 8 by 8 array of empty strings " do
      board = Board.new
      expect(board.rows.size).to eql(8)
      expect(board.rows.first.size).to eql(8)
    end
  end
  describe '#get' do
    it 'returns the value at coordinates [x,y]' do
      board = Board.new
      expect(board.get(4,3)).to eql("")
    end
  end
  describe 'set' do
    it 'changes the value at coordinates [x,y] and returns it' do
      board = Board.new
      expect(board.set(4,3,'X')).to eql('X')
    end
  end
  describe '#isoccupied?' do
    it 'returns true if there is a piece on the square and false if not' do
      board = Board.new
      expect(board.isoccupied?(2,7)).to eql(true)
    end
  end

end

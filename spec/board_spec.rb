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
      expect(board.get('d', 3)).to eql("")
    end
  end
  describe 'set' do
    it 'changes the value at coordinates [x,y] and returns it' do
      board = Board.new
      expect(board.set(4,3,'X')).to eql('X')
      expect(board.set('d', 3, 'X')).to eql('X')
    end
  end
  describe '#isoccupied?' do
    it 'returns true if there is a piece on the square and false if not' do
      board = Board.new
      expect(board.isoccupied?(2,7)).to eql(true)
      expect(board.isoccupied?(4,4)).to eql(false)
    end
  end
  describe '#find' do
    it 'returns the square(s) on which a piece is on' do
      board = Board.new
      expect(board.find('white', "knight")).to eql([[1,7], [6,7]])
    end
  end
  describe "#islegal?" do
    it "returns true if the move is legal depending on the piece, false if not" do
      board = Board.new
      expect(board.islegal?('white', 'e4')).to eql(true)
      expect(board,islegal?('black', 'Nc4')).to eql(false)
    end
  end
  describe '#move' do
    it 'gets a piece and sets it to a square, then removes it from  the old position' do
      board = Board.new
      expect(move('white', 'Nc3')).to eql(set(2,4,♞))
    end
  end

end

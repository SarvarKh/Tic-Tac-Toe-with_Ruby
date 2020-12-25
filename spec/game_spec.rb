require_relative '../lib/board.rb'

describe Board do
  describe 'initialize' do
    it "returns initialized instance variable game_board " do
      my_board = Board.new
      expect(my_board.game_board[2]).to eql(' ')
    end

    it "returns initialized instance variable turn_counter " do
      my_board = Board.new
      expect(my_board.turn_counter).to eql(0)
    end
    
    it "returns initialized instance variables boardx " do
      my_board = Board.new
      expect(my_board.boardx).to eql([])
    end

    it "returns initialized instance variables boardo " do
      my_board = Board.new
      expect(my_board.boardo).to eql([])
    end
  end
end
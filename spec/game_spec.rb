require_relative '../lib/board.rb'

describe Board do
  my_board = Board.new

  describe 'initialize' do
    it "returns initialized instance variable game_board " do
      expect(my_board.game_board[2]).to eql(' ')
    end

    it "returns initialized instance variable turn_counter " do
      expect(my_board.turn_counter).to eql(0)
    end
    
    it "returns initialized instance variables boardx " do
      expect(my_board.boardx).to eql([])
    end

    it "returns initialized instance variables boardo " do
      expect(my_board.boardo).to eql([])
    end
  end

  describe 'move' do
    it "adds user 'X' move to the game board " do
      my_board.move(2, 'x', my_board.boardx)
      expectation = my_board.game_board[1]
      actual = 'x'
      expect(expectation).to eql(actual)
    end

    it "adds user 'O' move to the game board " do
      my_board.move(3, 'o', my_board.boardo)
      expectation = my_board.game_board[2]
      actual = 'o'
      expect(expectation).to eql(actual)
    end

    it "adds user moves as an integer into the user_board " do
      my_board.boardo = [] # To clear inputs made from aboe 2 methods
      
      my_board.move(1, 'o', my_board.boardo)
      expectation = my_board.boardo
      actual = [1]
      expect(expectation).to eql(actual)
    end

    it "adds user moves as an integer into the user_board " do
      my_board.boardx = [] # To clear inputs made from aboe 2 methods

      my_board.move(6, 'x', my_board.boardx)
      expectation = my_board.boardx
      actual = [6]
      expect(expectation).to eql(actual)
    end
  end
end

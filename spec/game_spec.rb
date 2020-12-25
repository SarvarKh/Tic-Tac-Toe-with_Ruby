require_relative '../lib/board.rb'

describe Board do
  my_board = Board.new

  describe 'initialize' do
    it 'returns initialized instance variable game_board ' do
      expect(my_board.game_board[2]).to eql(' ')
    end

    it 'returns initialized instance variable turn_counter ' do
      expect(my_board.turn_counter).to eql(0)
    end

    it 'returns initialized instance variables boardx ' do
      expect(my_board.boardx).to eql([])
    end

    it 'returns initialized instance variables boardo ' do
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

    it 'adds user moves as an integer into the user_board ' do
      my_board.boardo = [] # To clear inputs made from aboe 2 methods

      my_board.move(1, 'o', my_board.boardo)
      expectation = my_board.boardo
      actual = [1]
      expect(expectation).to eql(actual)
    end

    it 'adds user moves as an integer into the user_board ' do
      my_board.boardx = [] # To clear inputs made from aboe 2 methods

      my_board.move(6, 'x', my_board.boardx)
      expectation = my_board.boardx
      actual = [6]
      expect(expectation).to eql(actual)
    end
  end

  describe 'taken_move?' do
    it 'returns false since position in the board is not taken (not empty) ' do
      my_board.game_board = [' ', 'x', 'o', 'x', ' ', ' ', ' ', ' ', ' ']
      expectation = my_board.taken_move?(1, my_board.game_board)
      actual = false
      expect(expectation).to eql(actual)
    end

    it 'returns true since position in the board has been taken (filled) ' do
      my_board.game_board = [' ', 'x', 'o', 'x', ' ', ' ', ' ', ' ', ' ']
      expectation = my_board.taken_move?(3, my_board.game_board)
      actual = true
      expect(expectation).to eql(actual)
    end
  end

  ### check_winner
  describe 'check_winner' do
    it 'returns winner if the winner meet winning combinations ' do
      my_board.boardx = [4, 5, 6]
      expectation = my_board.check_winner(my_board.boardx, my_board.boardo, 'Sarvar')
      actual = 'Sarvar'
      expect(expectation).to eql(actual)
    end

    it 'returns winner if the winner meet winning combinations ' do
      my_board.boardo = [3, 5, 7]
      expectation = my_board.check_winner(my_board.boardx, my_board.boardo, 'Juwon')
      actual = 'Juwon'
      expect(expectation).to eql(actual)
    end
  end
  ### display
  describe 'display' do
    it 'returns current game board ' do
      my_board.game_board = [' ', 'x', 'o', 'x', ' ', ' ', ' ', ' ', ' ']
      expectation = my_board.display
      actual = ['   | x | o ',
                '------------',
                ' x |   |   ',
                '------------',
                '   |   |   ']
      expect(expectation).to eql(actual)
    end

    it 'returns current game board ' do
      my_board.game_board = %w[x x o x o o o x x]
      expectation = my_board.display
      actual = [' x | x | o ',
                '------------',
                ' x | o | o ',
                '------------',
                ' o | x | x ']
      expect(expectation).to eql(actual)
    end
  end

  ### reference_board
  describe 'reference_board' do
    it 'returns reference board' do
      expectation = my_board.reference_board
      actual =
        <<-BOARD
        1 | 2 | 3
      ------------
        4 | 5 | 6
      ------------
        7 | 8 | 9
        BOARD
      expect(expectation).to eql(actual)
    end
  end
end

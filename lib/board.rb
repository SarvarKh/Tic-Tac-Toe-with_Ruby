class Board
  attr_accessor :game_board, :turn_counter, :boardx, :boardo

  def initialize
    @game_board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @turn_counter = 0
    @boardx = []
    @boardo = []
  end

  def move(user_move, user_sign, board)
    @user_move = user_move
    @user_sign = user_sign
    @board = board
    @game_board[@user_move.to_i - 1] = @user_sign
    @game_board[@user_move.to_i - 1] = @user_sign
    @user_sign == 'x' ? @boardx << @user_move.to_i : @boardo << @user_move.to_i
  end

  def taken_move?(move, board)
    @move = move
    @board = board
    board[move.to_i - 1] != ' '
  end

  WINNING_COMBINATIONS = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ].freeze

  def check_winner(boardx, boardo, current_user)
    @boardx = boardx
    @boardo = boardo
    @current_user = current_user
    i = 0
    while i < WINNING_COMBINATIONS.size
      return @current_user if WINNING_COMBINATIONS[i].all? { |number| @boardx.include? number }
      return @current_user if WINNING_COMBINATIONS[i].all? { |number| @boardo.include? number }

      i += 1
    end
  end

  def display
    [" #{@game_board[0]} | #{@game_board[1]} | #{@game_board[2]} ",
     '------------',
     " #{@game_board[3]} | #{@game_board[4]} | #{@game_board[5]} ",
     '------------',
     " #{@game_board[6]} | #{@game_board[7]} | #{@game_board[8]} "]
  end

  def reference_board
    <<-BOARD
        1 | 2 | 3
      ------------
        4 | 5 | 6
      ------------
        7 | 8 | 9
    BOARD
  end
end

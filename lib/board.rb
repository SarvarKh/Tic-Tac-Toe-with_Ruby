class Board
  attr_accessor :game_board

  def initialize
    @game_board = ['', '', '', '', '', '', '', '', '']
  end

  def move(user_move, user_sign)
    @user_move = user_move
    @user_sign = user_sign
    @game_board[@user_move.to_i - 1] = @user_sign
  end

  def display
    [" #{@game_board[0]}  | #{@game_board[1]}  | #{@game_board[2]} ",
     '------------',
     " #{@game_board[3]}  | #{@game_board[4]}  | #{@game_board[5]} ",
     '------------',
     " #{@game_board[6]}  | #{@game_board[7]}  | #{@game_board[8]} "]
  end
end
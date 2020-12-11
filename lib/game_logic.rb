class Board
  @board = [
    '', '', '',
    '', '', '',
    '', '', ''
  ]

  def self.print_board(selected_cell, user_turn)
    @board[selected_cell - 1] = user_turn

    puts ''
    print @board[0..2]
    puts ''
    print @board[3..5]
    puts ''
    print @board[6..8]
  end
end

class InnerBoard
  attr_accessor :board_for_x, :board_for_o
  def initialize; end

  @@winning_combinations = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ]

  @@board_for_x = [
    '', '', '',
    '', '', '',
    '', '', ''
  ]

  @@board_for_o = [
    '', '', '',
    '', '', '',
    '', '', ''
  ]

  def move_inner_board_x(move)
    @@board_for_x[move - 1] = move
    p @@board_for_x
  end

  def move_inner_board_o(move)
    @@board_for_o[move - 1] = move
    p @@board_for_o
  end

  def check_win_combo(board, user)
    i = 0
    winner_print = "\n\n\n**************\n**          **\n** #{user} won! **\n**          **\n**************\n\n"
    while i < @@winning_combinations.size
      if @@winning_combinations[i].all? { |number| board.include? number }
        puts winner_print
        exit
      end
      i += 1
    end
  end
end

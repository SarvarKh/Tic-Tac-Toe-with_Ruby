class Board
  @@board = [
    '', '', '',
    '', '', '',
    '', '', ''
  ]

  def self.print_board(selected_cell, user_turn)
    @@board[selected_cell - 1] = user_turn

    puts ''
    print @@board[0..2]
    puts ''
    print @@board[3..5]
    puts ''
    print @@board[6..8]
  end
end

class InnerBoard
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
end
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
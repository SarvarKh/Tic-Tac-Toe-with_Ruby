# current_user = current_user.name
# sign = current_user.sign
# my_board = my_board

def make_move(current_user, sign, my_board)
  puts "#{current_user} - select the number from the table below"
  puts my_board.reference_board if my_board.turn_counter.positive?
  move = gets.chomp
  while my_board.taken_move?(move, my_board.game_board)
    puts 'Invalid number, please select another number'
    move = gets.chomp
    my_board.taken_move?(move, my_board.game_board)
  end

  my_board.move(move, sign, my_board)
  puts my_board.display

  found_winner = my_board.check_winner(my_board.boardx, my_board.boardo, current_user)
  if found_winner
    puts "#{found_winner} won!"
    puts "Do you want to play another round?\nEnter 'Y' or 'yes' if you want to continue. Otherwise press any key to end the game!"
    end_game = gets.chomp
    if end_game == 'Y' || end_game == 'yes'
      end_game
      my_board.turn_counter = 10
    else
      exit
    end
  end

  my_board.turn_counter += 1
  puts 'It is draw!' if my_board.turn_counter == 9
end
#!/usr/bin/env ruby

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

end_game = 'Y'

while %(yes Y y Yes YES).include?(end_game)
  puts '**    Hey folks!    **'
  puts "Let's play Tic-Tac-Toe"

  playerx = Player.new
  playerx.sign = 'x'
  puts "Enter user 'X' name."
  playerx.name = gets.chomp
  while playerx.name =~ /[^a-zA-Z]/ || playerx.name == ''
    puts 'Invalid name, enter another name'
    playerx.name = gets.chomp
  end

  playero = Player.new
  playero.sign = 'o'
  puts "Enter user 'O' name."
  playero.name = gets.chomp
  while playero.name =~ /[^a-zA-Z]/ || playero.name == '' || playero.name == playerx.name
    puts 'Invalid name, enter another name'
    playero.name = gets.chomp
  end

  # Start the game
  my_board = Board.new

  # Game rules
  puts 'To see the game rules press any button!'
  gets.chomp
  puts "Each player shall select the number from table below! (only numbers from 1 to 9!)\n"
  puts my_board.reference_board

  # Game flow
  def check_current_user(playerx, playero, turn_counter)
    turn_counter.to_i.even? ? playerx : playero
  end

  while my_board.turn_counter.to_i < 9
    current_user = check_current_user(playerx, playero, my_board.turn_counter)

    puts "#{current_user.name} - select the number from the table below"
    move = gets.chomp
    while my_board.taken_move?(move, my_board.game_board) || move =~ /[^0-9]/
      puts 'Invalid number, please select another number'
      move = gets.chomp
      my_board.taken_move?(move, my_board.game_board)
    end

    my_board.move(move, current_user.sign, my_board)
    puts my_board.display

    found_winner = my_board.check_winner(my_board.boardx, my_board.boardo, current_user.name)
    if found_winner
      puts "#{found_winner} won!"
      puts 'Do you want to play another round?'
      puts "Enter 'Y' or 'yes' if you want to continue. Otherwise press any key to end the game!"
      end_game = gets.chomp
      %w[yes Y y Yes YES].include?(end_game) ? my_board.turn_counter = 8 : exit
      end_game
    end

    unless my_board.game_board.include?(' ')
      puts 'It is draw!'
      puts 'Do you want to play another round?'
      puts "Enter 'Y' or 'yes' if you want to continue. Otherwise press any key to end the game!"
      end_game = gets.chomp
      puts ''
    end

    my_board.turn_counter += 1
  end
end

#!/usr/bin/env ruby

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

puts '**    Hey folks!    **'
puts "Let's play Tic-Tac-Toe"

playerx = Player.new
playerx.sign = 'x'
puts "Enter user 'X' name."
playerx.name = gets.chomp
while playerx.name == ''
  puts 'Invalid name, enter another name'
  playerx.name = gets.chomp
end

playero = Player.new
playero.sign = 'o'
puts "Enter user 'O' name."
playero.name = gets.chomp
while playero.name == '' || playero.name == playerx.name
  puts 'Invalid name, enter another name'
  playero.name = gets.chomp
end

# Game rules
puts 'To see the game rules press any button!'
gets.chomp
puts "Each player shall select the number from table below! (only numbers from 1 to 9!)\n"
puts <<-BOARD
        1 | 2 | 3
      ------------
        4 | 5 | 6
      ------------
        7 | 8 | 9
BOARD

# Start the game
my_board = Board.new

def make_move(current_user, sign, my_board)
  puts "#{current_user} - select the number."
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
    exit
  end

  my_board.turn_counter += 1
  puts 'It is draw!' if my_board.turn_counter == 9
end

def check_current_user(playerx, playero, turn_counter)
  turn_counter.to_i.even? ? playerx : playero
end

while my_board.turn_counter.to_i < 9
  current_user = check_current_user(playerx, playero, my_board.turn_counter)
  make_move(current_user.name, current_user.sign, my_board)
end

#!/usr/bin/env ruby

require_relative '../lib/game_logic.rb'

# Welcome method
class StartGameInterface
  attr_accessor :user_x, :user_o

  def initialize; end

  def welcome
    puts '**        Hey folks!        **'
    puts "\n---Let's play Tic-Tac-Toe.---"
  end

  # Get user names
  def input_usernames
    puts "\nEnter user 'X' name."
    @user_x = gets.chomp
    puts "\nEnter user 'O' name."
    @user_o = gets.chomp
  end

  # User names validity check
  def username_validity
    while @user_x == '' || @user_o == '' || @user_x == @user_o
      puts "\n-!- Player's name mustn't be left blank or be the same."
      input_usernames.call
      username_validity.call
    end
  end

  # Game explanation
  def game_rules
    puts "\nWelcome #{@user_x} and #{@user_o}!\n"
    puts "Let's have look to the game rules!"
    gets.chomp
    puts "\nThe game instructions: how to play this game?"
    puts "Each player shall select the number from table below! (only numbers from 1 to 9!)\n"
    puts <<-BOARD
            1 | 2 | 3
          ------------
            4 | 5 | 6
          ------------
            7 | 8 | 9
    BOARD
  end

  # Start the game
  def move_x
    game_x = InnerBoard.new

    puts "\n\n#{@user_x} - User 'x' select the number."
    user_x_step = gets.chomp
    if user_x_step.to_i.positive? && user_x_step.to_i < 10
      puts "Your move [#{user_x_step}] is displayed on the board"
      Board.print_board(user_x_step.to_i, 'x')
      game_x.move_inner_board_x(user_x_step.to_i)
      game_x.check_win_combo_x(@user_x)
    else
      puts 'Selected move is invalid'
      end_game.call
    end
  end

  def move_o
    game_o = InnerBoard.new

    puts "#{@user_o} - User 'o' select the number."
    user_o_step = gets.chomp
    if user_o_step.to_i.positive? && user_o_step.to_i < 10
      puts "Your move [#{user_o_step}] is displayed on the board"
      Board.print_board(user_o_step.to_i, 'o')
      game_o.move_inner_board_o(user_o_step.to_i)
      game_o.check_win_combo_o(@user_o)
    else
      puts 'Selected move is invalid'
      end_game.call
    end
  end

  def combined_game_methods
    i = 1
    while i <= 5
      move_x
      puts "\nNow, it is other player's turn\nPlease select only from available moves\n\n"
      move_o

      if i == 5
        puts "\n\n-=*-=*-=*-=*-=*-=*-=*-=*-=*-=*-=*-=*-=*-=*"
        puts '-=*                                    -=*'
        puts '-=*    Selected move is a draw move!   -=*'
        puts '-=*                                    -=*'
        puts '-=*-=*-=*-=*-=*-=*-=*-=*-=*-=*-=*-=*-=*-=*'
      end

      i += 1
    end
  end

  # Do you want to end or play again?
  def end_game
    puts "\n\n=----------- Do you want to play again? -----------="
    puts "----------- Enter 'yes' or 'no' -----------"
    @restart = gets.chomp

    unless @restart == 'yes' || @restart == 'no'
      puts "\n-!- ATTENTION -!- Please enter only 'yes' or 'no'. Other replies are invalid!"
      end_game.call
    end

    case @restart
    when 'yes'
      puts "\n\n\n\n-*--*--*--*- You restarted the game! -*--*--*--*-\n\n\n\n"
      # restart method
      restart
    when 'no'
      puts '====================== The End ======================'
    else
      puts "Please enter only 'yes' or 'no', others inputs are invalid!"
    end
  end

  def restart
    welcome
    input_usernames
    username_validity
    game_rules
    combined_game_methods
    end_game
  end
end

interaction = StartGameInterface.new
interaction.welcome
interaction.input_usernames
interaction.username_validity
interaction.game_rules
interaction.combined_game_methods
interaction.end_game

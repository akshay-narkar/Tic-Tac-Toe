#!/usr/bin/env ruby
# Game flow

require_relative '../lib/game_logic'
require_relative '../lib/create_game'

def new_board
  puts "|#{new_board.array[0]}|#{new_board.array[1]}|#{new_board.array[2]}|"
  puts "|#{new_board.array[3]}|#{new_board.array[4]}|#{new_board.array[5]}|"
  puts "|#{new_board.array[6]}|#{new_board.array[7]}|#{new_board.array[8]}|"
  puts
  # result = check_result(array)
  # game_over if result == true
end
# define game rules

def game_rules
  puts
  puts 'Rules are Follows'
  puts "1. Game ends when either 3 X's or 3 0's are made one one after the other Horizontally, vertically
or diagonally"
  puts '2. Game ends in a draw when all squares are filled or and no winning sequence is reached.'
  puts '3. Player 1 is X & player 2 is 0'
  puts
  puts 'Lets Begin the Game'
  puts
end

def valid_moves
  puts 'Valid Moves are as follows:'
  puts
  x = valid_array.valid_moves
  x.each_with_index { |item, index| print "#{index + 1} " if item == 'A' }
  puts
end

def check_move
  move = gets.chomp.strip
  check = false
  until check == true
    check = move_made.move_new(move)
    if check == false
      puts 'Invalid Move, enter correct position'
      move = gets.chomp.strip
    end
  end
  
end

# player 1 turn

def player_one
  puts
  puts 'Your Turn player 1'
  puts
  puts 'The Current Board looks like this'
  puts
  new_board
  puts
  valid_moves
  puts
  puts 'Enter your position Player 1'
  check_move
  puts
  move
  new_board(move, 1)
  #   result = check_result
  #   game_over if result == true
end

def player_two
  puts
  puts 'Your Turn player 2'
  puts
  puts 'The Current Board looks like this'
  puts
  new_board
  puts
  valid_moves
  puts 'Enter your position Player 2'
  move = gets.chomp
  move = check_move(move)
  new_board(move, 2)
  #   result = check_result
  #   game_over if result == true
end

def game_over
  puts 'Thank You for playing'
  puts 'Would you like to play again? Press Y to continue'
  # play_again = gets.chomp
  # exit 1 unless %w[Y y].include?(play_again)
end

puts
puts 'Lets Play Tic Tac Toe!'
puts
# Get player names
puts
puts 'Enter Player 1 Name'
puts
player1 = gets.chomp.strip
player1 = 'Player 1' if player1 == ''
puts
new_player1 = Player.new(player1)
puts "Player 1 is #{new_player1.name}"
puts
puts 'Enter Player 2 Name'
puts
player2 = gets.chomp.strip
puts
player2 = 'Player 2' if player2 == ''
puts
new_player2 = Player.new(player2)
puts "Player 2 is #{new_player2.name}"
puts

# Initialize array and result
puts 'Welcome to the Game'
# result = false
game_rules
new_board = Newboard.new
valid_array = Valid.new
move_made = Move.new

result = Checkresult.new(false)

while result.result == false
  player_one
  player_two
end

# def player_one
#   puts 'Your Turn player 1'
#   # puts 'The Current Board looks like this'
#   # puts "|#{array[0]}|#{array[1]}|#{array[2]}|"
#   # puts "|#{array[3]}|#{array[4]}|#{array[5]}|"
#   # puts "|#{array[6]}|#{array[7]}|#{array[8]}|"
#   puts 'Valid Moves are as follows:'

#   # Share valid positions here

#   # move = nil
#   puts 'Enter your position Player 1'
#   move = gets.chomp

#   # if move is invalid, inform which moves are valid and takes input again in a loop
#   #  puts 'Invalid Input. Please Input from number 1 to 9' if move conditions

#   puts "You have marked position #{move}"

#   # call function to check if a winning pattern is made or if it is a draw
#   puts 'The Current Board looks like this'
#   puts "|#{array[0]}|#{array[1]}|#{array[2]}|"
#   puts "|#{array[3]}|#{array[4]}|#{array[5]}|"
#   puts "|#{array[6]}|#{array[7]}|#{array[8]}|"

#   # if a draw or victory is sealed, share that player has won and share board and return to calling function
# end

# # player 2 turn

# def player_two
#   puts 'Your turn player 2'
#   # puts 'The Current Board looks like this'
#   # puts "|#{array[0]}|#{array[1]}|#{array[2]}|"
#   # puts "|#{array[3]}|#{array[4]}|#{array[5]}|"
#   # puts "|#{array[6]}|#{array[7]}|#{array[8]}|"
#   puts 'Valid Moves are as follows:'

#   # Share valid positions
#   # move = nil
#   puts 'Enter your position Player 2'
#   move = gets.chomp

#   # if move is invalid, inform which moves are valid and takes input again
#   # puts 'Invalid Input. Please Input from number 1 to 9' if move conditions

#   puts "You have marked position #{move}"

#   # call function to check if a winning pattern is made or if it is a draw

#   puts 'The Current Board looks like this'
#   puts "|#{array[0]}|#{array[1]}|#{array[2]}|"
#   puts "|#{array[3]}|#{array[4]}|#{array[5]}|"
#   puts "|#{array[6]}|#{array[7]}|#{array[8]}|"

#   # if a draw or victory is sealed, share that player has won and share board and return to calling function
# end

# # to display game result

# def game_result(_player_name)
#   puts 'Winner is player_name'
#   puts 'The Game is a Draw'
#   puts 'Would you like to play again? Press Y to continue'
#   # play_again = gets.chomp
# end

# # initial input

# def game_input
#   # array = [[0,1,1],[1,1,1],[1,1,1]]
#   puts "|#{array[0]}|#{array[1]}|#{array[2]}|"
#   puts "|#{array[3]}|#{array[4]}|#{array[5]}|"
#   puts "|#{array[6]}|#{array[7]}|#{array[8]}|"
# end

# game_rules # call game rules
# game_input # call game input

# # keep checking for game result before executing

# until result[0] == false
#   result[0] = player_turn1 if result[0] == false
#   result[0] = player_turn2 if result[0] == false
# end

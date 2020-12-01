#!/usr/bin/env ruby
# Game flow

puts 'Lets Play Tic Tac Toe!'

# Get player names

puts 'Enter Player 1 Name'
player1 = gets.chomp
player1 = 'Player 1' if player1 == ''
puts "Player 1 is #{player1}"

puts 'Enter Player 2 Name'
player2 = gets.chomp
player2 = 'Player 2' if player2 == ''

puts "Player 2 is #{player2}"
puts

# Initialize array and result

result = [false, '']
array = [0, 0, 0, 0, 0, 0, 0, 0, 0]
p array
# define game rules

def game_rules
  puts
  puts 'Rules are Follows'
  puts "1. Game ends when either 3 X's or 3 0's are made one one after the other Horizontally, vertically
or diagonally"

  puts '2. Game ends in a draw when all squares are filled or and no winning sequence is reached.'
  puts '3. Player 1 is X & player 2 is 0'
  puts
end

# player 1 turn

def player_one
  puts 'Your Turn player 1'
  # puts 'The Current Board looks like this'
  # puts "|#{array[0]}|#{array[1]}|#{array[2]}|"
  # puts "|#{array[3]}|#{array[4]}|#{array[5]}|"
  # puts "|#{array[6]}|#{array[7]}|#{array[8]}|"
  puts 'Valid Moves are as follows:'

  # Share valid positions here

  # move = nil
  puts 'Enter your position Player 1'
  move = gets.chomp

  # if move is invalid, inform which moves are valid and takes input again in a loop
  #  puts 'Invalid Input. Please Input from number 1 to 9' if move conditions

  puts "You have marked position #{move}"

  # call function to check if a winning pattern is made or if it is a draw
  puts 'The Current Board looks like this'
  puts "|#{array[0]}|#{array[1]}|#{array[2]}|"
  puts "|#{array[3]}|#{array[4]}|#{array[5]}|"
  puts "|#{array[6]}|#{array[7]}|#{array[8]}|"

  # if a draw or victory is sealed, share that player has won and share board and return to calling function
end

# player 2 turn

def player_two
  puts 'Your turn player 2'
  # puts 'The Current Board looks like this'
  # puts "|#{array[0]}|#{array[1]}|#{array[2]}|"
  # puts "|#{array[3]}|#{array[4]}|#{array[5]}|"
  # puts "|#{array[6]}|#{array[7]}|#{array[8]}|"
  puts 'Valid Moves are as follows:'

  # Share valid positions
  # move = nil
  puts 'Enter your position Player 2'
  move = gets.chomp

  # if move is invalid, inform which moves are valid and takes input again
  # puts 'Invalid Input. Please Input from number 1 to 9' if move conditions

  puts "You have marked position #{move}"

  # call function to check if a winning pattern is made or if it is a draw

  puts 'The Current Board looks like this'
  puts "|#{array[0]}|#{array[1]}|#{array[2]}|"
  puts "|#{array[3]}|#{array[4]}|#{array[5]}|"
  puts "|#{array[6]}|#{array[7]}|#{array[8]}|"

  # if a draw or victory is sealed, share that player has won and share board and return to calling function
end

# to display game result

def game_result(_player_name)
  puts 'Winner is player_name'
  puts 'The Game is a Draw'
  puts 'Would you like to play again? Press Y to continue'
  # play_again = gets.chomp
end

# initial input

def game_input
  # array = [[0,1,1],[1,1,1],[1,1,1]]
  puts 'Lets Begin the Game'
  puts "|#{array[0]}|#{array[1]}|#{array[2]}|"
  puts "|#{array[3]}|#{array[4]}|#{array[5]}|"
  puts "|#{array[6]}|#{array[7]}|#{array[8]}|"
end

game_rules # call game rules
game_input # call game input

# keep checking for game result before executing

until result[0] == false
  result[0] = player_turn1 if result[0] == false
  result[0] = player_turn2 if result[0] == false
end

#!/usr/bin/env ruby
# Game flow
puts 'Lets Play Tic Tac Toe!'
puts 'Enter Player 1 Name'
player1 = gets.chomp
player1 = 'Player 1' if player1 == ''
puts "Player 1 is #{player1}"

puts 'Enter Player 2 Name'
player2 = gets.chomp
player2 = 'Player 2' if player2 == ''

puts "Player 2 is #{player2}"
puts

def game_rules
  puts
  puts 'Rules are Follows'
  puts "1. Game ends when either 3 X's or 3 0's are made one one after the other Horizontally, vertically or diagonally"
  puts '2. Game ends in a draw when all squares are filled or and no winning sequence is reached.'
  puts '3. Player 1 is X & player 2 is 0'
  puts
end

def player_turn
  puts 'Your Turn player 1'
  move = gets.chomp
  puts "Your move is #{move}"
  puts 'Invalid Input. Please Input from number 1 to 9'

  puts 'Your turn player 2'
  move = gets.chomp
  puts "Your move is #{move}"
  puts 'Invalid Input. Please Input from number 1 to 9'
end

def game_result
  puts 'Winner is Player 1'
  puts 'The Game is a Draw'
  puts 'Would you like to play again? Press Y to continue'
end

def game_input
  # array = [[0,1,1],[1,1,1],[1,1,1]]
  array = [0, 0, 0, 0, 0, 0, 0, 0, 0]

  puts "|#{array[0]}|#{array[1]}|#{array[2]}|"
  puts "|#{array[3]}|#{array[4]}|#{array[5]}|"
  puts "|#{array[6]}|#{array[7]}|#{array[8]}|"
end

# def input(input,player)

#  if player=="player1"
#     array[input] =  "X"
#  else
#     array[input] =  "0"
#  end

# puts "|#{array[0]}|#{array[1]}|#{array[2]}|"
# puts "|#{array[3]}|#{array[4]}|#{array[5]}|"
# puts "|#{array[6]}|#{array[7]}|#{array[8]}|"
# play
# end
# puts

# def play

# move = nil
# while move.isnil? || move < 1 && move>9
# puts "Enter your position Player 1"
# move = gets.chomp
# end
# puts "You have marked position #{move}"
# input(move-1,"player1")

# move = nil
# while move.isnil? || move < 1 && move>9
# puts "Enter your position Player 2"
# move = gets.chomp
# end
# puts "You have marked position #{move}"
# input(move-1,"player2")
# end

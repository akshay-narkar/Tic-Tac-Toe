#!/usr/bin/env ruby
# Game flow
require_relative '../lib/create_game'
require_relative '../lib/game_logic'

play_again = 'Y'

def new_board_main(new_board)
  puts "The Current Board position looks like this \n"
  puts "|#{new_board.array[0]}|#{new_board.array[1]}|#{new_board.array[2]}|"
  puts "|#{new_board.array[3]}|#{new_board.array[4]}|#{new_board.array[5]}|"
  puts "|#{new_board.array[6]}|#{new_board.array[7]}|#{new_board.array[8]}| \n"
end
# define game rules

def game_rules
  puts "\n Rules are Follows"
  puts "1. Game ends when either 3 X's or 3 0's are made one one after the other Horizontally, vertically
or diagonally"
  puts '2. Game ends in a draw when all squares are filled or and no winning sequence is reached.'
  puts "3. Player 1 is X & player 2 is 0 \n"
  puts "\nLets Begin the Game\n"
end

def valid_moves(valid_array, new_board)
  puts "Valid Moves are as follows:\n"
  x = valid_array.valid_moves_logic(new_board)
  x.each_with_index { |item, index| print "#{index + 1} " if item == 'A' }
  puts
end

def check_move(move_made, valid_array, new_board)
  move = gets.chomp.strip
  check = false
  until check == true
    check = move_made.move_new(move, valid_array)
    next unless check == false

    puts "Invalid Move\n"
    valid_moves(valid_array, new_board)
    puts "Enter correct position\n"
    move = gets.chomp.strip
  end
  puts "You entered in position #{move} \n"
  move
end

def make_move(move, player, new_board)
  new_board.input_marker(move, player)
end

# player 1 turn

def player_one(valid_array, move_made, new_board, new_player1, result)
  puts "Your Turn #{new_player1.name}\n"
  new_board_main(new_board)
  valid_moves(valid_array, new_board)
  puts "Enter your position #{new_player1.name}\n"
  move = check_move(move_made, valid_array, new_board)
  puts
  make_move(move, 'player1', new_board)
  new_board_main(new_board)
  final = result.check_result('player1', new_board)
  game_over(new_player1, final) if result.result1 == true || result.result1 == 'draw'
end

def player_two(valid_array, move_made, new_board, new_player2, result)
  puts "Your Turn #{new_player2.name}\n"
  new_board_main(new_board)
  valid_moves(valid_array, new_board)
  puts "Enter your position #{new_player2.name}\n"
  move = check_move(move_made, valid_array, new_board)
  puts
  make_move(move, 'player2', new_board)
  new_board_main(new_board)
  final = result.check_result('player2', new_board)
  game_over(new_player2, final) if result.result1 == true || result.result1 == 'draw'
end

def game_over(new_player, final)
  case final
  when 'player1'
    new_player1 = new_player
    puts " #{new_player1.name} is the winner! Congratulations!!!"
  when 'player2'
    new_player2 = new_player
    puts " #{new_player2.name} is the winner! Congratulations!!!"
  when 'draw'
    puts 'Match is drawn'
  end
  puts "Thank You for playing\n"
  puts "Would you like to play again? Press Y to continue\n"
  play_again = gets.chomp.strip
  exit 1 unless %w[Y y].include?(play_again)
end

while %w[Y y].include?(play_again)
  puts "Lets Play Tic Tac Toe!\n"
  # Get player name
  puts "Enter Player 1 Name \n"
  player1 = gets.chomp.strip
  player1 = 'Player 1' if player1 == ''
  puts
  new_player1 = Player.new(player1)
  puts "Player 1 is #{new_player1.name}\n"
  puts "Enter Player 2 Name\n"
  player2 = gets.chomp.strip
  puts
  player2 = 'Player 2' if player2 == ''
  puts
  new_player2 = Player.new(player2)
  puts "Player 2 is #{new_player2.name}"
  puts

  # Initialize array and result
  puts "Welcome to the Game\n"
  game_rules
  new_board = Newboard.new
  valid_array = Valid.new
  move_made = Move.new

  result = Checkresult.new(false)

  while result.result1 == false
    player_one(valid_array, move_made, new_board, new_player1, result)
    player_two(valid_array, move_made, new_board, new_player2, result) if result.result1 == false
  end
end

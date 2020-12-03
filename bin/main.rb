#!/usr/bin/env ruby
# Game flow
require_relative '../lib/create_game'
require_relative '../lib/game_logic'

play_again = 'Y'

def new_board_main(new_board)
  puts 'The Current Board position looks like this:', ''
  puts "|#{new_board.array[0]}|#{new_board.array[1]}|#{new_board.array[2]}|"
  puts "|#{new_board.array[3]}|#{new_board.array[4]}|#{new_board.array[5]}|"
  puts "|#{new_board.array[6]}|#{new_board.array[7]}|#{new_board.array[8]}|"
  puts
end

def valid_moves(valid_array, new_board)
  print 'Valid Moves are as follows: '
  x = valid_array.valid_moves_logic(new_board)
  x.each_with_index { |item, index| print "#{index + 1} " if item == 'A' }
  puts
  puts 'Enter any of the above number to mark your position'
end

def check_move(move_made, valid_array, new_board)
  move = gets.chomp.strip
  check = false
  until check == true
    check = move_made.move_new(move, valid_array)
    next unless check == false

    puts 'Invalid Move', ''
    valid_moves(valid_array, new_board)
    puts
    puts 'Enter correct position', ''
    move = gets.chomp.strip
  end
  puts "You entered in position #{move}"
  move
end

def make_move(move, player, new_board)
  new_board.input_marker(move, player)
end

# player 1 turn

def player_one(valid_array, move_made, new_board, new_player1, result)
  puts "Your Turn #{new_player1.name}", ''
  new_board_main(new_board)
  valid_moves(valid_array, new_board)
  puts
  puts "Enter your position #{new_player1.name}", ''
  move = check_move(move_made, valid_array, new_board)
  puts
  make_move(move, 'player1', new_board)
  new_board_main(new_board)
  final = result.check_result('player1', new_board)
  game_over(new_player1, final) if result.result1 == true || result.result1 == 'draw'
end

def player_two(valid_array, move_made, new_board, new_player2, result)
  puts "Your Turn #{new_player2.name}", ''
  new_board_main(new_board)
  valid_moves(valid_array, new_board)
  puts
  puts "Enter your position #{new_player2.name}", ''
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
    puts "#{new_player1.name} is the winner! Congratulations!!!", ''
  when 'player2'
    new_player2 = new_player
    puts "#{new_player2.name} is the winner! Congratulations!!!", ''
  when 'draw'
    puts 'Match is drawn'
  end
  puts 'Thank You for playing', ''
  puts 'Would you like to play again? Press Y to continue, anything else to quit', ''
  play_again = gets.chomp.strip
  exit 1 unless %w[Y y].include?(play_again)
end

def start_game
  puts
  puts 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
  puts 'x                              x'
  puts 'x    Lets Play Tic Tac Toe!    x'
  puts 'x                              x'
  puts 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
  puts
end

while %w[Y y].include?(play_again)
  # Get player name
  puts
  puts 'Enter Player 1 Name:'
  player1 = gets.chomp.strip
  player1 = 'Player 1' if player1 == ''
  new_player1 = Player.new(player1)
  puts
  puts "Player 1 is \"#{new_player1.name}\"", ''
  puts 'Enter Player 2 Name:'
  player2 = gets.chomp.strip
  player2 = 'Player 2' if player2 == ''
  new_player2 = Player.new(player2)
  puts
  puts "Player 2 is \"#{new_player2.name}\""

  # Initialize array and result
  start_game
  new_board = Newboard.new
  valid_array = Valid.new
  move_made = Move.new

  result = Checkresult.new(false)

  while result.result1 == false
    player_one(valid_array, move_made, new_board, new_player1, result)
    player_two(valid_array, move_made, new_board, new_player2, result) if result.result1 == false
  end
end

class CheckResult
  attr_reader :result1
  attr_accessor :points

  def initialize(result)
    @result1 = result
    @win_combinations = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7], %w[2 5 8], %w[3 6 9], %w[1 5 9], %w[3 5 7]]
    @points = 0
  end

  def check_result(player, new_board)
    @win_combinations.each do |array|
      array.each do |n|
        @points += 1 if new_board.array[n.to_i - 1] == 'X'
        @points -= 1 if new_board.array[n.to_i - 1] == 'O'
      end
      if @points == 3 || @points == -3
        @result1 = true
        return player
      end
      @points = 0
    end
    check_draw(new_board) if @result1 == false
  end

  def check_draw(new_board)
    @result1 = 'draw' if new_board.array.none?('-')
    'draw'
  end
end

class Valid
  attr_reader :valid_move

  def initialize
    @valid_move = []
  end

  def valid_moves_logic(new_board)
    new_board.array.each_with_index do |x, y|
      @valid_move[y] = if x == '-'
                         'A'
                       else
                         '-'
                       end
    end

    @valid_move
  end
end

class Move
  def move_new(move, valid_array)
    if move.to_i >= 1 && move.to_i < 10
      valid_array.valid_move[move.to_i - 1] == 'A'
    else
      false
    end
  end
end

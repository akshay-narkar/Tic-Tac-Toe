# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

class Checkresult
  attr_reader :result1

  def initialize(result)
    @result1 = result
  end

  def check_result(player, new_board)
    i = 0
    while i < 7
      if new_board.array[i] != '-' && new_board.array[i] == new_board.array[i + 1] && \
         new_board.array[i + 1] == new_board.array[i + 2] && new_board.array[i + 2] == new_board.array[i]
        @result1 = true
        return player
      end
      i += 3
    end
    check_vertical(player, new_board) if @result1 == false
  end

  def check_vertical(player, new_board)
    i = 0
    while i < 3
      if new_board.array[i] != '-' && new_board.array[i] == new_board.array[i + 3] && \
         new_board.array[i + 3] == new_board.array[i + 6] && new_board.array[i + 6] == new_board.array[i]
        @result1 = true
        return player
      end
      i += 1
    end
    check_left_diagonal(player, new_board) if @result1 == false
  end

  def check_left_diagonal(player, new_board)
    i = 0
    while i < 1
      if new_board.array[i] != '-' && new_board.array[i] == new_board.array[i + 4] && \
         new_board.array[i + 4] == new_board.array[i + 8] && new_board.array[i + 8] == new_board.array[i]
        @result1 = true
        return player
      end
      i += 1
    end
    check_right_diagonal(player, new_board) if @result1 == false
  end

  def check_right_diagonal(player, new_board)
    i = 0
    while i < 1
      if new_board.array[i + 2] != '-' && new_board.array[i + 2] == new_board.array[i + 4] && \
         new_board.array[i + 4] == new_board.array[i + 6] && new_board.array[i + 6] == new_board.array[i]
        @result1 = true
        return player
      end
      i += 1
    end
    check_draw(new_board) if @result1 == false
  end

  # rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

  def check_draw(new_board)
    @result1 = 'draw' if new_board.array.none?('-')
    'draw'
  end
end

class Valid
  attr_reader :validarray

  def initialize
    @validarray = []
  end

  def valid_moves_logic(new_board)
    new_board.array.each_with_index do |x, y|
      @validarray[y] = if x == '-'
                         'A'
                       else
                         '-'
                       end
    end

    @validarray
  end
end

class Move
  def move_new(move, valid_array)
    if move.to_i >= 1 && move.to_i < 10
      valid_array.validarray[move.to_i - 1] == 'A'
    else
      false
    end
  end
end

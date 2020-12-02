require_relative './bin/testmain'

class Checkresult
  attr_reader :result

  def initialize(result)
    @result = result
  end

  def check_result
    # x = rand(3)
    # puts
    # if x.zero?
    #     puts 'Winner is Player 1'
    # elsif x.odd?
    #     puts 'Winner is Player 2'
    # else
    #     puts 'Its a draw'
    # end
    # puts
  end
end

class Valid
  attr_reader :validarray

  def initialize(_validarray)
    @validarray = []
  end

  def valid_moves
    new_board.array.each_with_index do |x, y|
      @validarray[y] = 'A' if x == '-'
    end
  end
  @validarray
end

class Move
  attr_accessor :move_made?

  def move_new(move)
    if move.ord > 48 && move.ord < 58
        if move.to_a
    else
      false
    end
    @validarray
  end
end

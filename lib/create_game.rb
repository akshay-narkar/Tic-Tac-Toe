class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Newboard
  attr_accessor :array

  def initialize
    @array = %w[- - - - - - - - -]
  end

  def input_marker(input = nil, player = nil)
    @array[input.to_i - 1] = 'X' if player == 'player1'
    @array[input.to_i - 1] = 'O' if player == 'player2'
  end
end

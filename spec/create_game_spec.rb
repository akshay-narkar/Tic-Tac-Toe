require_relative '../lib/create_game'

describe Player do
  it 'Player is Initialized with a name' do
    expect(Player.new('Akshay').name).to eq('Akshay')
  end
end

describe NewBoard do
  newboard = NewBoard.new
  context 'Initializes Game Board and play moves' do
    it 'Creates the blank array' do
      expect(newboard.array).to eq(['-', '-', '-', '-', '-', '-', '-', '-', '-'])
    end
    it 'Insert into array as a player 1' do
      newboard.input_marker(1, 'player1')
      expect(newboard.array).to eq(['X', '-', '-', '-', '-', '-', '-', '-', '-'])
    end
    it 'Insert into array as a player 2' do
      newboard.input_marker('3', 'player2')
      expect(newboard.array).to eq(['X', '-', 'O', '-', '-', '-', '-', '-', '-'])
    end
  end
end

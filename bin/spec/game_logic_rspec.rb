require '../../lib/game_logic'
require '../../lib/create_game'

newboard = NewBoard.new

describe Move do
  subject { Move.new }
  newboard.array = ['X', '-', '-', '-', '-', '-', '-', '-', '-']

  context 'Check if move is legal or not' do
    it 'Move is legal' do
      expect(subject.move_new(2, newboard)).to be_truthy
    end
    it 'Move is illegal. Position Already taken' do
      expect(subject.move_new(1, newboard)).to be_falsy
    end
    it 'Move is illegal. Out of bounds input' do
      expect(subject.move_new(10, newboard)).to be_falsy
    end
    it 'Move is illegal. Out of bounds input' do
      expect(subject.move_new('Z', newboard)).to be_falsy
    end
  end
end

describe CheckResult do
  context 'To check the result of the game' do
    it 'Check result when called by any player & is not full' do
      result = CheckResult.new(false)
      newboard.array = ['X', '-', '-', '-', '-', '-', '-', '-', '-']
      expect(result.check_result('Player1', newboard)).to be_falsy
    end
    it 'Check result when called by player 1 & is a win' do
      result = CheckResult.new(false)
      newboard.array = ['X', '-', '-', 'X', '-', '-', 'X', '-', '-']
      expect(result.check_result('Player1', newboard)).to eq('Player1')
    end
    it 'Check result when called by player 2 & is a win ' do
      result = CheckResult.new(false)
      newboard.array = ['O', '-', '-', 'O', '-', '-', 'O', '-', '-']
      expect(result.check_result('Player2', newboard)).to eq('Player2')
    end
    it 'Check result when called by any player & is a draw ' do
      result = CheckResult.new(false)
      newboard.array = %w[X 0 X O O X X X O]
      expect(result.check_result('Player2', newboard)).to eq('draw')
    end
  end
end

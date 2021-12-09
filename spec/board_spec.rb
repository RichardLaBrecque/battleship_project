require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
  it 'exists' do
    board = Board.new


    expect(board).to be_instance_of(Board)
  end

  it 'has cells' do
    board = Board.new


    expect(board.cells.keys.size).to eq(16)
  end
end

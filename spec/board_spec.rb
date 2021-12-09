require './lib/board'
require './lib/ship'
require './lib/cell'
require 'pry'

RSpec.describe Board do
  it 'exists' do
    board = Board.new


    expect(board).to be_instance_of(Board)
  end

  it 'has a hash of cells' do
    board = Board.new
#binding.pry
    expect(board.cells.class).to eq(Hash)
  end

  it 'has 16 cells' do
    board = Board.new

    expect(board.cells.keys.size).to eq(16)
  end

  it 'has cells as values of hash' do
    board = Board.new

    expect(board.cells.values.first).to be_instance_of(Cell)
  end
end

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

  # Valid placement testing
  it 'can tell valid coordinates exist' do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
  end

  it 'can tell invalid coordinates dont exist' do
    board = Board.new

    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it 'compairs ship length to placement length' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it 'checks coordinates consescutive isnt reversed' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  end

  it 'checks coordinates are not diagonal' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
  end

  it 'displays true for proper placement' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  it 'shows false for overlapped ship placement' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)

  end

  it 'can place ship' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])


    expect(board.cells["A1"].empty?).to be(false)
    expect(board.cells["A2"].empty?).to be(false)
    expect(board.cells["A3"].empty?).to be(false)
  end

  it 'can place ship' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)



    expect(board.cells["A1"].empty?).to be(true)
  end
end

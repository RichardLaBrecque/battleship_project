require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/computer'

#Pseudocode time!
#Class computer is initalized with array of ships, new board,
#Class has method place_ships.
#place_ships iterates through @ships[], randomly choosing position.
#random positions validated by method in board
#if valid:  then assign those cells to that ship. return array of cells used?


RSpec.describe Computer do
  it 'exists' do
    computer_player = Computer.new

    expect(computer_player).to be_instance_of(Computer)
  end

  it 'has array of ships' do
    computer_player = Computer.new

    expect(computer_player.ships).to be_instance_of(Array)
    expect(computer_player.ships[0]).to be_instance_of(Ship)
  end

  it 'can place ships' do
    computer_player = Computer.new
    computer_player.place_ships

    #check returns array of placed cells
    expect(computer_player.place_ships).to be_instance_of(Array)
  end

  it 'computer placed cells are valid' #might already be tested within method?
    computer_player = Computer.new
    computer_player.place_ships
      #Wrong. As written .place_ships would return one array for all ships. would need to split for each ship, return, and check individually.
    expect(computer_player.board.valid_placement?(board.ship_1, computer.place_ships)).to eq(true)
end

require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/computer'
require 'pry'
class Game
  attr_reader :player_board, :computer_board, :player_cruiser
  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    #@cruiser = Ship.new(cruiser, 3)
    #@sub = Ship.new(sub, 2)
  end

  def player_cruiser(curiser_coords)
    coords = curiser_coords
    cruiser = Ship.new(cruiser, 3)
    coords.upcase!
    @player_board.place(cruiser, coords.split(" "))
    puts player_board.render(true)
  end

  def player_sub(sub_coords)
    coords = sub_coords
    cruiser = Ship.new(cruiser, 3)
    coords.upcase!
    @player_board.place(sub, coords.split(" "))
    puts player_board.render(true)
  end


end

require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/computer'
require 'pry'
class Game
  attr_reader :player_board, :computer_board, :player_ship_count, :computer_ship_count
  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_ship_count = 2
    @computer_ship_count = 2
    #@cruiser = Ship.new(cruiser, 3)
    #@sub = Ship.new(sub, 2)
  end


  def player_cruiser(curiser_coords)
    coords = curiser_coords
    cruiser = Ship.new(cruiser, 3)
    coords.upcase!
    until player_board.valid_placement?(cruiser, coords.split(" ")) do
        puts 'invalid coords please try again'
    coords = gets.chomp
    end
    @player_board.place(cruiser, coords.split(" "))
    puts player_board.render(true)
  end

  def player_sub(sub_coords)
    coords = sub_coords
    submarine = Ship.new(submarine, 2)
    coords.upcase!
    @player_board.place(submarine, coords.split(" "))
    puts player_board.render(true)
  end


end

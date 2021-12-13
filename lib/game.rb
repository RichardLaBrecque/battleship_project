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


  def player_cruiser(cruiser_coords)
    coords = cruiser_coords
    cruiser = Ship.new(cruiser, 3)
    coords.upcase!
    until (player_board.valid_coordinate?(cruiser_coords.split(" ")[0]) && player_board.valid_coordinate?(cruiser_coords.split(" ")[1]) && player_board.valid_coordinate?(cruiser_coords.split(" ")[2]) && player_board.valid_placement?(cruiser,  cruiser_coords.split(" "))) do
        puts 'invalid coords please try again'
     cruiser_coords = gets.chomp
    coords = cruiser_coords.upcase!

    end
   @player_board.place(cruiser, coords.split(" "))
    puts player_board.render(true)
  end

  def player_sub(sub_coords)
    coords = sub_coords
    sub = Ship.new(sub, 2)
    coords.upcase!
    until (player_board.valid_coordinate?(sub_coords.split(" ")[0]) && player_board.valid_coordinate?(sub_coords.split(" ")[1]) && player_board.valid_placement?(sub,  sub_coords.split(" "))) do
        puts 'invalid coords please try again'
     sub_coords = gets.chomp
    coords = sub_coords.upcase!

    end
   @player_board.place(sub, coords.split(" "))
    puts player_board.render(true)
  end
end

require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/computer'
require 'pry'
class Game
  attr_reader :player_board, :computer_board, :player_ship_count, :computer_ship_count
  def initialize
    @player_board = Board.new
    @computer_player = Computer.new
    @player_ship_count = 2
    @computer_ship_count = 2
    @cruiser = Ship.new("cruiser", 3)
    @sub = Ship.new("sub", 2)
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

  def setup
    @computer_player.place_ships(@cruiser)
    @computer_player.place_ships(@sub)
  end
  def start

    puts "Ships Placed, LETS GO"
    puts "=============COMPUTER BOARD============="
    puts @computer_player.computer_board.render
    puts "==============PLAYER BOARD=============="
    puts player_board.render
    until @player_ship_count == 0 || @computer_ship_count == 0 do
      puts "Enter the coordinate for your shot"
      coord = gets.chomp
        until @computer_player.computer_board.valid_coordinate?(coord.upcase) && @computer_player.computer_board.cells[coord.upcase].fired_upon? == false do
          puts "invalid coordinate try again"
          coord = gets.chomp
        end
        @computer_player.computer_board.cells[coord.upcase].fire_upon
        #binding.pry
          if @computer_player.computer_board.cells[coord.upcase].render == "X"
            @computer_ship_count -= 1
          end
            shot = @computer_player.fire(@player_board)
            @player_board.cells[shot].fire_upon
            if @player_board.cells[shot].render == "X"
              @player_ship_count -= 1
            end
  p "=============COMPUTER BOARD============="
  puts "#{@computer_player.computer_board.render}"
  p "==============PLAYER BOARD=============="
  puts "#{player_board.render}"
        if @computer_player.computer_board.cells[coord.upcase].render == "X"
          puts "Your shot on #{coord.upcase} was a hit. That ship is sunk."
        elsif @computer_player.computer_board.cells[coord.upcase].render == "H"
          puts "Your shot on #{coord.upcase} was a hit."
        elsif @computer_player.computer_board.cells[coord.upcase].render == "M"
          puts "Your shot on #{coord.upcase} was a miss."
        end
        if @player_board.cells[shot].render == "X"
          puts "My shot on #{shot} was a hit. That ship is sunk."
        elsif @player_board.cells[shot].render == "H"
          puts "My shot on #{shot} was a hit."
        elsif @player_board.cells[shot].render == "M"
          puts "My shot on #{shot} was a miss."
        end

    end
    if @player_ship_count == 0
      puts "I WIN"
    elsif @computer_ship_count == 0
      puts "YOU WIN"
    end
  end
  end

require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'
require './lib/computer'
require 'pry'

puts "Welcome to Battleship"
puts "Enter p to play, Enter q to quit"
  play = gets.chomp
  if play == "p"
    game = Game.new
  else play == "q"
    puts "goodbye"
  end

  puts "I have laid out my ships on the grid."
  puts "You now need to layout your two ships"
  puts "The cruiser three units long, and the Submarine is 2 units long"

puts game.player_board.render
cruiser = Ship.new(cruiser, 3)
submarine = Ship.new(submarine, 2)
   puts 'enter the squares for the cruiser (3 spaces)'
cruiser_coords = gets.chomp

game.player_cruiser(cruiser_coords)
#cruiser_coords.upcase!
#game.player_board.place(cruiser, cruiser_coords.split(" "))
#puts game.player_board.render(true)

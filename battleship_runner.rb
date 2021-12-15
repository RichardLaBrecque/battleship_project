require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'
require './lib/computer'
game = Game.new


puts "Welcome to Battleship"
puts "Enter p to play. Enter any other key to quit."
  play = gets.chomp
  while play == "p" do
    game.setup
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships"
    puts "The Cruiser is three units long, and the Submarine is 2 units long"
    puts game.player_board.render
    puts 'Enter the squares for the cruiser (3 spaces):'
    cruiser_coords = gets.chomp
    game.player_cruiser(cruiser_coords)
    puts "Enter the squares for the Submarine (2 spaces):"
    submarine = gets.chomp
    game.player_sub(submarine)
    game.start
    puts "To play again enter p. Enter any other key to exit."
    play = gets.chomp
  end
    puts "Goodbye"

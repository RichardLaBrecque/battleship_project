require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'
require './lib/computer'
game = Game.new


p "Welcome to Battleship"
p "Enter p to play, Enter any other key to quit"
  play = gets.chomp
  while play == "p" do
    game.setup
    p "I have laid out my ships on the grid."
    p "You now need to layout your two ships"
    p "The cruiser three units long, and the Submarine is 2 units long"
    puts game.player_board.render
    p 'enter the squares for the cruiser (3 spaces)'
    cruiser_coords = gets.chomp
    game.player_cruiser(cruiser_coords)
    p "Enter the sqaures for the Submarine (2 spaces)"
    submarine = gets.chomp
    game.player_sub(submarine)
    game.start
    p "to play again enter p, or any other key to exit"
    play = gets.chomp
  end
    puts "goodbye"

require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'
require './lib/computer'


puts "Welcome to Battleship"
puts "Enter p to play, Enter any other key to quit"
  play = gets.chomp
  while play == "p" do
    game = Game.new
    game.setup
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships"
    puts "The cruiser three units long, and the Submarine is 2 units long"
    puts game.player_board.render
    #cruiser = Ship.new(cruiser, 3)
    #submarine = Ship.new(submarine, 2)
    puts 'enter the squares for the cruiser (3 spaces)'
    cruiser_coords = gets.chomp
    game.player_cruiser(cruiser_coords)
    puts "Enter the sqaures for the Submarine (2 spaces)"
    submarine = gets.chomp
    game.player_sub(submarine)
    game.start
    puts "to play again enter p, or any other key to exit"
    play = gets.chomp
  #  puts "Ships Placed, LETS GO"
  #  puts "=============COMPUTER BOARD============="
  #  puts game.computer_board.render
  #  puts "==============PLAYER BOARD=============="
  #  puts game.player_board.render
  end
    puts "goodbye"

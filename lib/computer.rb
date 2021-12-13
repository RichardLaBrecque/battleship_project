class Computer

  def initialize
    #@computer_cruiser = Ship.new("Cruiser", 3)
    #@computer_sub = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @all_coords = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4","D1", "D2", "D3", "D4"]
    #can probably refactor to check distance from corner to avoid these
    #@valid_coords_length_2 = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4","D1", "D2", "D3"]
    @valid_coords_length_3 = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2","D1", "D2"]

  end


  def place_ships (ship)

    if ship.length == 2
      @ship_coord = [@all_coords[rand(14)], @all_coords[rand(15)]]

      while @computer_board.valid_placement?(ship, @ship_coord) == false do
      #puts "Thinking..."
        @ship_coord.pop
        @ship_coord << @all_coords[rand(15)]
      end
      @computer_board.place(ship, @ship_coord)
    #puts "placed at #{@ship_coord}"
    end

    if ship.length == 3
      @ship_coord = [@valid_coords_length_3[rand(11)], @all_coords[rand(14)]]
      comp_check = true
        while @computer_board.valid_placement?(ship, @ship_coord, comp_check) == false do
          puts "Thinking about first spot..."
          @ship_coord.pop
          @ship_coord << @all_coords[rand(14)]
        end
      @ship_coord << @all_coords[rand(15)]
        while @computer_board.valid_placement?(ship, @ship_coord, ) == false do
          puts "Thinking about second spot.."
          @ship_coord.pop
          @ship_coord << @all_coords[rand(15)]
        end
    end


  return @ship_coord
  end

end

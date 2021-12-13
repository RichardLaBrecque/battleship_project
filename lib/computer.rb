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
      @ship_coord = [@all_coords[rand(15)], @all_coords[rand(16)]]

      while @computer_board.valid_placement?(ship, @ship_coord) == false do
      #puts "Thinking..."
        @ship_coord.pop
        @ship_coord << @all_coords[rand(16)]
      end
      @computer_board.place(ship, @ship_coord)
    #puts "placed at #{@ship_coord}"
    end

    if ship.length == 3
      @ship_coord = [@valid_coords_length_3[rand(12)], @all_coords[rand(15)]]
      comp_check = true
      #first 2 cells

      counter = 0

        while @computer_board.valid_placement?(ship, @ship_coord, comp_check) == false do
          puts "Thinking about second spot..."
          @ship_coord.pop
          @ship_coord << @all_coords[rand(15)]
          puts "Ship coords #{@ship_coord}"
        end
        #last cell
      @ship_coord << @all_coords[rand(16)]
        while @computer_board.valid_placement?(ship, @ship_coord, ) == false do
          puts "Thinking about third spot.."
          @ship_coord.pop
          @ship_coord << @all_coords[rand(16)]
          puts "Ship coords #{@ship_coord}"
          #Hotfix! initial placement B3, C2 valid b/c c2,c3,c4 but sometimes selects d2 next leaving no other valid option
          counter += 1
          puts counter
          if counter > 30
            @ship_coord.pop

            while @computer_board.valid_placement?(ship, @ship_coord, comp_check) == false do
              puts "Thinking about second spot..."
              @ship_coord.pop
              @ship_coord << @all_coords[rand(15)]
              puts "Ship coords #{@ship_coord}"
              counter = 0
            end
          end
        end

    end


  return @ship_coord
  end

end

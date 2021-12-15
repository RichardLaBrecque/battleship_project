class Computer
  attr_reader :computer_board
  def initialize
    @computer_board = Board.new
    @all_coords = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4","D1", "D2", "D3", "D4"]
    @valid_coords_length_3 = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2","D1", "D2"]
  end

  def fire (board)# pick cell at random, check valid coord, only fire same place once
    coord_shot = @all_coords[rand(16)]
      until board.valid_coordinate?(coord_shot) && board.cells[coord_shot].fired_upon? == false do
        coord_shot = @all_coords[rand(16)]
      end
    return coord_shot
  end

  def place_ships (ship)
    counter = 0
    if ship.length == 2
      ship_coord = [@all_coords[rand(15)], @all_coords[rand(16)]] #index0=rand15
      #test if pos 1 is valid, one of the options for pos 2 is valid
        until @computer_board.valid_coordinate?(@all_coords[0]) && ((@computer_board.valid_coordinate?(@all_coords[1]))||(@computer_board.valid_coordinate?(@all_coords[4]))) do
          ship_coord = [@all_coords[rand(15)], @all_coords[rand(16)]] #index0=rand15
        end
      until @computer_board.valid_placement?(ship, ship_coord) == true do
        ship_coord.pop
        ship_coord << @all_coords[rand(16)]
        counter += 1
          if counter > 30
            ship_coord = [@all_coords[rand(15)], @all_coords[rand(16)]]
            counter = 0
          end
      end
    end

    if ship.length == 3
    #first 2 cells
      ship_coord = [@valid_coords_length_3[rand(12)], @all_coords[rand(15)]]
      comp_check = true
          #check 2nd cell
      until @computer_board.valid_placement?(ship, ship_coord, comp_check) == true do
        ship_coord.pop
        ship_coord << @all_coords[rand(15)]
      end
        #add random last cell
    ship_coord << @all_coords[rand(16)]
      until @computer_board.valid_placement?(ship, ship_coord) == true do
        ship_coord.delete_at(2)
        ship_coord << @all_coords[rand(16)]
        counter += 1
        if counter > 30
          ship_coord.delete_at(2)
          ship_coord.delete_at(1)
          ship_coord << @all_coords[rand(15)]

          until @computer_board.valid_placement?(ship, ship_coord, comp_check) == true do
            ship_coord.delete_at(1)
            ship_coord << @all_coords[rand(15)]
          end
          counter = 0
        end
      end
    end
  @computer_board.place(ship, ship_coord)
  return ship_coord
  end
end

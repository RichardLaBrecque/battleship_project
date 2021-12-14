class Computer

  def initialize
    @computer_board = Board.new
    @all_coords = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4","D1", "D2", "D3", "D4"]
    @valid_coords_length_3 = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2","D1", "D2"]


  end

  def fire (board)# fire at random, check valid coord, only fire same place once,
    shots=0
    open_coords = @all_coords
    coord_shot = open_coords[index=rand(16-shots)]
      until board.valid_coordinate?(coord_shot)
        coord_shot = open_coords[index=rand(16-shots)]
      end
    shots += 1
    open_coords.delete_at((index-1))
    return coord_shot
  end

  def place_ships (ship)
    counter = 0
    if ship.length == 2
      ship_coord = [@all_coords[index0=rand(15)], @all_coords[rand(16)]]
      #test if pos 1 is valid, one of the options for pos 2 is valid
        until @computer_board.valid_coordinate?(@all_coords[index0]) && ((@computer_board.valid_coordinate?(@all_coords[index0+1]))||(@computer_board.valid_coordinate?(@all_coords[index0+4]))) do
          ship_coord = [@all_coords[index0=rand(15)], @all_coords[rand(16)]]
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

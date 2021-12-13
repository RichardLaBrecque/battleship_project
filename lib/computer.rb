class Computer

  def initialize
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_sub = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @all_coords = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4","D1", "D2", "D3", "D4"]
    @valid_coords_length_2 = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4","D1", "D2", "D3"]
    @valid_coords_length_3 = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2","D1", "D2"]
    place_ships

  end


  def place_ships
    @ship_coord = [@valid_coords_length_2[rand(14)], @all_coords[rand(15)]]

    while @computer_board.valid_placement?(@computer_sub, @ship_coord) == false do
      #puts "Thinking..."
      @ship_coord.pop
      @ship_coord << @all_coords[rand(15)]
    end
    @computer_board.place(@computer_sub, @ship_coord)
    #puts "placed at #{@ship_coord}"
  end

end

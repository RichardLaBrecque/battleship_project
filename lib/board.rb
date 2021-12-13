require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells, :coords
  def initialize
    @cells = {} #cells exist here as hash key/value pair, key is cell value is coordinate string
    cells_array = [] #array of cells to be moved to hash @cells
    @coords = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4","D1", "D2", "D3", "D4"]

    @coords.each do |cord|
      cells_array << Cell.new(cord)
    end
    cells_array.each do |cell|
      @cells[cell.coordinate] = cell
    end
  end

  def valid_coordinate?(coord)
    @coords.include?(coord)
  end

  def valid_placement?(ship, placement, comp_check = false)
      @rows = []
      @columns = []

      #check coordinates are not the same
      if placement.uniq.size != placement.size
        return false
      end

      #check all cells empty
      placement.each do |coordinate|
        if @cells[coordinate].empty? == false
          return false
        end
      end
      # check length
      if comp_check == false
        if placement.length != ship.length
          return false
        end
      end

      #split coordinates, convert to numerical
      placement.each do |position|
        @rows << position[0].ord
        @columns << position[1].ord
      end

       #check diagonal placement
      if @rows.uniq.size != 1 && @columns.uniq.size != 1
        return false
      end

      #check if row has only consecutive values
      @rows.each_with_index do|val, index|
        if index > 0 && @rows.uniq.size != 1
          if (val - @rows[index-1]) != 1
            return false
          end
        end
      end

      #check if column has only consecutive values
      @columns.each_with_index do|val, index|
        if index > 0 && @columns.uniq.size != 1
          if (val - @columns[index-1]) != 1
            return false
          end
        end
      end
      return true
    end

    def place (ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end

  def render(reveal = false)
    render_array = []
    @cells.each do |cell|
      render_array << cell[1].render(reveal)
    end
    return "  1 2 3 4 \nA #{render_array[0]} #{render_array[1]} #{render_array[2]} #{render_array[3]} \nB #{render_array[4]} #{render_array[5]} #{render_array[6]} #{render_array[7]} \nC #{render_array[8]} #{render_array[9]} #{render_array[10]} #{render_array[11]} \nD #{render_array[12]} #{render_array[13]} #{render_array[14]} #{render_array[15]} \n"

  end
end


#this was thought #1 dont think itll do what i want
#until @cells.keys.length = 16 do
#  @cells = Hash.new { |hash, key| hash[cell.coordinate] = cell }
#end
# should this be a new class? CellMaker?
# cells_array = []
# coords = []
# coords.each do |cord|
#   cells_array << Cell.new(cord)
# end
# cells_array.each do |cell|
#   @cells[cell.coordinate] = cell
# end

require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells
  def initialize
    @cells = {} #cells exist here as hash key/value pair, key is cell coordinate string
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
    #@coords.include?(coord)
    @cells.keys.include?(coord)
  end

  def valid_placement?(ship, placement)
    @rows = []
    @columns = []

    #check all cells empty

    # check length
      if placement.length != ship.length
        false
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

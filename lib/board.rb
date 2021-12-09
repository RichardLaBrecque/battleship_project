require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells
  def initialize

    @cells = {
    }
  end
end
#this was thought #1 dont think itll do what i want
#until @cells.keys.length = 16 do
#  @cells = Hash.new { |hash, key| hash[cell.coordinate] = cell }
#end
# should this be a new class? CellMaker?
cells_array = []
coords = []
coords.each do |cord|
  cells_array << Cell.new(cord)
end
cells_array.each do |cell|
  @cells[cell.coordinate] = cell
end

require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells
  def initialize
    @cells = {}
    cells_array = []
    coords = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4","D1", "D2", "D3", "D4"]
    coords.each do |cord|
      cells_array << Cell.new(cord)
    end
    cells_array.each do |cell|
      @cells[cell.coordinate] = cell
    end
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

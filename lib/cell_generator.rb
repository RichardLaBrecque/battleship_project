require './lib/cell'
@cells = {}
cells_array = []
coords = ["A1", "A2", "A3", "A4", "B1", "B2"]
coords.each do |cord|
  cells_array << Cell.new(cord)
end
cells_array.each do |cell|
  @cells[cell.coordinate] = cell
end

p @cells

require './lib/cell'
require './lib/board'
require './lib/ship'
require 'pry'
@cells = {}
cells_array = []
coords = ["A1", "A2", "A3", "A4", "B1", "B2"]
coords.each do |cord|
 @cells[coordinate] = Cell.new(cord)
end
#cells_array.each do |cell|
#  @cells[cell.coordinate] = cell
#
p @cells

#board_1 = Board.new
#
#puts ' 1 2 3 4'
#board_1.cells.each_with_index do |cell, index|#
#  print " #{cell[1].render}"
  #print index%4
#    if index%4 == 3
#      print "\n"
#
#    end
#end

#puts "_" * 10
#richards try
#board_2 = Board.new
#cruiser = Ship.new("Cruiser", 3)
#board_2.place(cruiser, ["A1", "A2", "A3"])
#render_array = []
#board_2.cells.each do |cell|
#  reveal = true
#  render_array << cell[1].render(reveal)
#end
#print " 1 2 3 4 \nA #{render_array[0]} #{render_array[1]} #{render_array[2]} #{render_array[3]}\nB #{render_array[4]} #{render_array[5]} #{render_array[6]} #{render_array[7]}\nC #{render_array[8]} #{render_array[9]} #{render_array[10]} #{render_array[11]}\nD #{render_array[12]} #{render_array[13]} #{render_array[14]} #{render_array[15]}"

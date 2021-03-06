require './lib/cell'
require './lib/ship'
require 'pry'
RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Cell)
  end

  it 'tracks a coordinate' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  it 'has no ship' do
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
  end

  it 'is empty' do
    cell = Cell.new("B4")


    expect(cell.empty?).to eq(true)
  end

  it 'can hold a ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.ship).to be_instance_of(Ship)
  end

  it 'isnt empty' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.empty?).to eq(false)
  end

  it 'hasnt been fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to eq(false)
  end

  it 'has been fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.ship.health).to eq(2)
  end

  it 'knows it was fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.fired_upon?).to eq(true)
  end
  # render testing
  it 'can render itself' do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")
  end

  it 'can render a missed shot' do
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    expect(cell_1.render).to eq("M")
  end

  it 'can render itself with a hidden ship there' do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    expect(cell_1.render).to eq(".")
    expect(cell_2.render).to eq(".")
  end


  it 'can render a hits and misses' do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    #binding.pry
    cell_1.fire_upon
    expect(cell_1.render).to eq("M")
    expect(cell_2.render).to eq("H")
  end

  it 'render a sink' do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    cruiser.hit
    cruiser.hit

    expect(cell_2.render).to eq("X")
    #expect(cell_2.cruiser.sunk?).to eq(true)
  end

  it 'renders the truth' do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)



    #binding.pry
    expect(cell_1.render(true)).to eq(".")
    expect(cell_2.render(true)).to eq("S")
    #expect(cell_2.cruiser.sunk?).to eq(true)
  end

  it 'renders the truth even after a shot' do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon


    #binding.pry
    expect(cell_2.render).to eq("H")
    expect(cell_2.render(true)).to eq("S")
    #expect(cell_2.cruiser.sunk?).to eq(true)
  end
end

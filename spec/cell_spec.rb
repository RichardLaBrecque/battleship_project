require './lib/cell'
RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Cell)
  end

  xit 'tracks a coordinate' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  xit 'has no ship' do
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
  end

  xit 'is empty' do
    cell = Cell.new("B4")


    expect(cell.empty?).to eq(true)
  end

  xit 'can hold a ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.ship).to be_instance_of(Ship)
  end

  xit 'isnt empty' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.empty?).to eq(false)
  end

  it 'can hold a ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.ship).to be_instance_of(Ship)
  end


end

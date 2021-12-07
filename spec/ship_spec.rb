require 'pry'
require './lib/ship'

RSpec.describe Ship do
  it 'exists' do
    ship = Ship.new("Cruiser", 3)


    expect(ship).to be_instance_of(Ship)
  end

  it 'has a length' do
    ship = Ship.new("Cruiser", 3)


    expect(ship.length).to eq(3)
  end

  it 'has a type' do
    ship = Ship.new("Cruiser", 3)


    expect(ship.name).to eq("Cruiser")
  end

  it 'has health' do
    ship = Ship.new("Cruiser", 3)


    expect(ship.health).to eq(3)
  end
end

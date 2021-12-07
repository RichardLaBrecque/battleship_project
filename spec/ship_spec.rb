require 'pry'
require './lib/ship'

RSpec.describe Ship do
  it 'exists' do
    ship = Ship.new("Cruiser", 3)


    expect(ship).to be_instance_of(Ship)
  end

  it 'has a length' do
    cruiser = Ship.new("Cruiser", 3)


    expect(cruiser.length).to eq(3)
  end

  it 'has a type' do
    cruiser = Ship.new("Cruiser", 3)


    expect(cruiser.name).to eq("Cruiser")
  end

  it 'has health' do
    cruiser = Ship.new("Cruiser", 3)


    expect(cruiser.health).to eq(3)
  end
end

require 'pry'

RSpec.describe Ship do
  it 'exists' do
    ship = ship.new("Cruiser", 3)


    expect(ship).to be_instance_of(Ship)
  end
end

class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      return true
    else
      return false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
    if @fired_upon == false
      @fired_upon =  true
      ship.hit
    end
  end

  def fired_upon?
    @fired_upon
  end

end

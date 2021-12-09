require './lib/ship.rb'
class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
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
    if empty?
      @fired_upon =  true
    elsif
      @fired_upon = true
      ship.hit
    end
  end

  def fired_upon?
    @fired_upon
  end

  def render(reveal = false)
    if reveal == true && empty? == false
      return "S"
    end
    if fired_upon? == false
      return "."
    end
    if empty?
      return "M"
    elsif @ship.sunk? == true
      return "X"
    elsif fired_upon? == true && empty? == false
      return "H"
    end
  end

end

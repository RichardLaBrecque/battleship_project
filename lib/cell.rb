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
      #puts @ship #if program breaks uncomment this
      return true
    else
      return false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
      @fired_upon =  true
    if empty? == false
      ship.hit
    end
  end

  def fired_upon?
    @fired_upon
  end

  def render(reveal = false)
    if reveal == true && empty? == false
      return "S"
    elsif fired_upon? == false
      return "."
    elsif empty?
      return "M"
    elsif @ship.sunk? == true
      return "X"
    else fired_upon? == true && empty? == false
      return "H"
    end
  end
end

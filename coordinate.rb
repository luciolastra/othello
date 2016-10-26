# Defines a two-dimensional coordinate object.

class Coordinate
  # Getter
  attr_reader :x, :y

  # Creates the 2D coordinate.
  #
  # <em>Params:</em>
  # +x+:: Integer - x value of the coordinate
  # +y+:: Integer - y value of the coordinate
  def initialize(x, y)
    @x = x
    @y = y
  end
end

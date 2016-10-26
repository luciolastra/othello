# Simple token class.

class Disc
  # Color getter.
  attr_reader :color  

  # Creates a new disc.
  #
  # <em>Params:</em>
  # +color+:: String - player's color
  def initialize(color)
    @color = color
  end

  # Displays itself. Used by Board 's display method. In this first
  # release just prints the color (String) and a pipe so it resembles
  # a grid.
  def display
    print  color + "|"
  end
end

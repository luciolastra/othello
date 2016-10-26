# Generic grid container. It serves as the base of the Board class.

class GridContainer
  # Creates an array of arrays of the amount of rows and columns specified.
  #
  # <em>Params:</em>
  # +rows+:: Integer - number of rows
  # +columns+:: Integer - number of columns
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @grid = Array.new(rows){Array.new(columns)}
  end

  # Determines if the given coordinate is a valid position on
  # the defined grid.
  #
  # <em>Params:</em>
  # +x+:: Integer - x value of the 2D coordinate
  # +y+:: Integer - y value of the 2D coordinate
  def valid_position?(x, y)
    x >= 0 && x <= (@rows -1) && y >= 0 && y <= (@columns -1)
  end

  # Gets the item (Object) in position (x, y) of the grid if:
  # * the given coordinates are valid
  #
  # <em>Params:</em>
  # +x+:: Integer - x value of the 2D coordinate
  # +y+:: Integer - y value of the 2D coordinate  
  def get_item(x, y)
    if valid_position?(x, y)
      @grid[x][y]
    end
  end
  
  # Sets the specified item (Object) in position (x, y) of the grid if:
  # 1. the given coordinates are valid
  # 2. the item is not nil
  #
  # <em>Params:</em>
  # +x+:: Integer - x value of the 2D coordinate
  # +y+:: Integer - y value of the 2D coordinate
  # +item+:: Object - any object
  def set_item(x, y, item)
    if valid_position?(x, y) && item != nil
      @grid[x][y] = item
    end
  end
end

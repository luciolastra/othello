# Tests the Coordinate class.

require 'minitest/autorun'
require '../coordinate'

class TestCoordinate < Minitest::Test
  # Creates a Coordinate object that represents (0, 7).
  def setup
    @coordinate = Coordinate.new(0, 7)
  end

  # Tests the x getter.
  def test_get_x
    assert_equal 0, @coordinate.x
  end
  
  # Tests the y getter.
  def test_get_y
    assert_equal 7, @coordinate.y
  end
end

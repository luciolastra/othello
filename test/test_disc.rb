# Tests the Disc class.

require 'minitest/autorun'
require '../disc'

class TestDisc < Minitest::Test
  # Creates a Disc object with color "X".
  def setup
    @disc = Disc.new("X")
  end

  # Tests the color getter.
  def test_get_color
    assert_equal "X", @disc.color
  end
    
  # Tests the display() method. It's a way to see how it displays itself,
  # the result is nil because it uses the 'print' method. Using 'puts'
  # would result in nil too.
  def test_display
    assert_equal nil, @disc.display
  end
end

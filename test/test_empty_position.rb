# Tests the EmptyPosition class.

require 'minitest/autorun'
require '../empty_position'

class TestEmptyPosition < Minitest::Test
  # Creates a EmptyPosition object.
  def setup
    @empty_position = EmptyPosition.new
  end

  # Tests the display() method. It's a way to see how it displays itself,
  # the result is nil because it uses the 'print' method. Using 'puts'
  # would result in nil too.
  def test_display
    assert_equal nil, @empty_position.display
  end
end

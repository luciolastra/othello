# Tests the Board class.
#
# As Board inherits from GridContainer and GridContainer has been tested
# extensively, the tests in this class are rather basic and use GridContainer's
# inherited methods without testing them.

require 'minitest/autorun'
require '../board'
require '../disc'
require '../empty_position'

class TestBoard < Minitest::Test
  # Creates a Board object.
  def setup
    @board = Board.new
  end

  # Tests that a newly created board has the initial four discs in the
  # correct positions and that the rest of the positions are empty.
  def test_initial_game_positions
    # From (0,0) to (2,7)
    3.times do |row|
      8.times do |column|
        assert_equal true, @board.get_item(row, column).is_a?(EmptyPosition)
      end
    end
    assert_equal true, @board.get_item(3, 0).is_a?(EmptyPosition)
    assert_equal true, @board.get_item(3, 1).is_a?(EmptyPosition)
    assert_equal true, @board.get_item(3, 2).is_a?(EmptyPosition)
    assert_equal true, @board.get_item(3, 5).is_a?(EmptyPosition)
    assert_equal true, @board.get_item(3, 6).is_a?(EmptyPosition)
    assert_equal true, @board.get_item(3, 7).is_a?(EmptyPosition)
    
    assert_equal 'O', @board.get_item(3, 3).color
    assert_equal 'X', @board.get_item(3, 4).color
    assert_equal 'X', @board.get_item(4, 3).color
    assert_equal 'O', @board.get_item(4, 4).color
    
    assert_equal true, @board.get_item(4, 0).is_a?(EmptyPosition)
    assert_equal true, @board.get_item(4, 1).is_a?(EmptyPosition)
    assert_equal true, @board.get_item(4, 2).is_a?(EmptyPosition)
    assert_equal true, @board.get_item(4, 5).is_a?(EmptyPosition)
    assert_equal true, @board.get_item(4, 6).is_a?(EmptyPosition)
    assert_equal true, @board.get_item(4, 7).is_a?(EmptyPosition)
    
    # From (5, 0) to (7,7)
    3.times do |row|
      8.times do |column|
        assert_equal true, @board.get_item(row + 5, column).is_a?(EmptyPosition)
      end
    end
  end
  
  # Tests the display() method. It's a way to see how it displays itself,
  # the result is nil because it uses the 'print' method. Using 'puts'
  # would result in nil too.
  def test_display
    assert_equal nil, @board.display
  end
end

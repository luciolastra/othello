# Tests the GridContainer class.

require 'minitest/autorun'
require '../grid_container'
require '../disc'
require '../empty_position'

class TestGridContainer < Minitest::Test
  # Creates a GridContainer object with the same dimensions as the board.
  def setup
    @grid_container = GridContainer.new(8, 8)
  end

  # Tests the valid_position? method.
  def test_valid_position
    # Tests the 64 valid positions. From (0,0) to (7,7).
    8.times do |row|
      8.times do |column|
        assert_equal true, @grid_container.valid_position?(row, column)
      end
    end

    # An equal amount (100) of Xs and Ys are randomly generated
    # from the same invalid range using different seeds. Each of the 100
    # resulting positions is invalid and will be tested.
    srand 10
    x_likely_invalid = (-100..100).to_a.sample(100)
    srand 20
    y_likely_invalid = (-100..100).to_a.sample(100)

    # Creates "100_invalid_positions.txt" file where combinations will be written.
    invalid_positions = open("100_invalid_positions.txt", 'w')
    invalid_positions.write("Invalid positions:")
    invalid_positions.write("\n")

    # Tests 100 invalid positions. 
    100.times do |position|
      invalid_positions.write("(#{x_likely_invalid[position]}, #{y_likely_invalid[position]})")
      invalid_positions.write("\n")
      assert_equal false, @grid_container.valid_position?(x_likely_invalid[position], y_likely_invalid[position])
    end
    invalid_positions.close
  end

  # Tests the set_item and get_item methods.
  def test_set_get_item
    # Build test board to populate to test the get_item method.
    test_board = Array.new(8){Array.new(8)}

    # Set seed for random function.
    srand 30

    # Populate test_board and the grid using set_item with the same objects.
    8.times do |row|
      8.times do |column|
        item = [Disc.new("X"), Disc.new("O"), EmptyPosition.new].sample
        test_board[row][column] = item
        @grid_container.set_item(row, column, item)
      end
    end

    # Test that each item contained in 'test_board" is the same as when sending the get_item
    # message to the grid as the receiver.
    8.times do |row|
      8.times do |column|
          assert_equal true, test_board[row][column] == @grid_container.get_item(row, column)
      end
    end
  end
end

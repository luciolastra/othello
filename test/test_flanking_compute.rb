# Tests the FlankingCompute class.

require 'minitest/autorun'
require '../flanking_compute'
require '../coordinate'

class TestFlankingCompute < Minitest::Test
  # Creates a new FlankingCompute object as if it was the result of one
  # of the four possible valid moves that player one has, namely (3,2)
  # from (3,4) right when the game starts.
  def setup
    @flanking_compute = FlankingCompute.new
    @flanking_compute.origin = Coordinate.new(3, 4)
    @flanking_compute.destination = Coordinate.new(3, 2)
    @flanking_compute.direction_offset = Coordinate.new(0, -1)
    @flanking_compute.disc_count = 1
  end

  # Tests the origin getter.
  def test_get_origin
    test_origin = Coordinate.new(3, 4)
    assert_equal test_origin.x, @flanking_compute.origin.x
    assert_equal test_origin.y, @flanking_compute.origin.y
  end
  
  # Tests the destination getter.
  def test_get_destination
    test_destination = Coordinate.new(3, 2)
    assert_equal test_destination.x, @flanking_compute.destination.x
    assert_equal test_destination.y, @flanking_compute.destination.y
  end
  
  # Tests the direction offfset getter.
  def test_get_direction_offset
    test_dir_offset = Coordinate.new(0, -1)
    assert_equal test_dir_offset.x, @flanking_compute.direction_offset.x
    assert_equal test_dir_offset.y, @flanking_compute.direction_offset.y
  end
  
  # Test the disc count getter.
  def test_get_disc_count
    assert_equal 1, @flanking_compute.disc_count
  end
end

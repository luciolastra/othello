# Tests the Player class.

require 'minitest/autorun'
require '../player'

class TestPlayer < Minitest::Test
  # Creates a Player object with name "Test" and color "X".
  def setup
    @player = Player.new("Test", "X")
  end

  # Tests the name getter.
  def test_get_name
    assert_equal "Test", @player.name
  end

  # Tests the color getter.
  def test_get_color
    assert_equal "X", @player.color
  end
  
  # Tests the make_move() method. The validity of the test depends on
  # the user input. I'll type "11" to test it, if other String is typed
  # the test will fail.
  def test_make_move
    assert_equal "11", @player.make_move
  end
end

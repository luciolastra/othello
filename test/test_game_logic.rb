# Tests the GameLogic class partially.
#
# The tests focus on two key public methods and are by no means
# exhaustive. 
#
# The next version of this file is expected to have tests for all
# GameLogic's methods.

require 'minitest/autorun'
require '../game_logic'

class TestGameLogic < Minitest::Test
  # Creates a GameLogic object along with different Board objects for testing.
  def setup
    @game_logic = GameLogic.new
    
    @empty_board = Board.new
    @empty_board.set_item(3, 3, EmptyPosition.new)
    @empty_board.set_item(3, 4, EmptyPosition.new)
    @empty_board.set_item(4, 3, EmptyPosition.new)
    @empty_board.set_item(4, 4, EmptyPosition.new)
    
    @only_black_discs_board = Board.new
    @only_black_discs_board.set_item(3, 3, Disc.new('X'))
    @only_black_discs_board.set_item(4, 4, Disc.new('X'))
    @only_black_discs_board.set_item(0, 0, Disc.new('X'))
    @only_black_discs_board.set_item(0, 7, Disc.new('X'))
    @only_black_discs_board.set_item(7, 0, Disc.new('X'))
    @only_black_discs_board.set_item(7, 7, Disc.new('X'))
    
    @only_white_discs_board = Board.new
    @only_white_discs_board.set_item(3, 4, Disc.new('O'))
    @only_white_discs_board.set_item(4, 3, Disc.new('O'))
    @only_white_discs_board.set_item(0, 0, Disc.new('O'))
    @only_white_discs_board.set_item(0, 7, Disc.new('O'))
    @only_white_discs_board.set_item(7, 0, Disc.new('O'))
    @only_white_discs_board.set_item(7, 7, Disc.new('O'))
    
    # This game state is valid and taken from a real game.
    @white_has_no_moves_board = Board.new
    # Set the 18 black discs.
    @white_has_no_moves_board.set_item(0, 7, Disc.new('X'))
    @white_has_no_moves_board.set_item(1, 7, Disc.new('X'))
    @white_has_no_moves_board.set_item(2, 7, Disc.new('X'))
    @white_has_no_moves_board.set_item(3, 7, Disc.new('X'))
    @white_has_no_moves_board.set_item(4, 7, Disc.new('X'))
    @white_has_no_moves_board.set_item(5, 7, Disc.new('X'))
    @white_has_no_moves_board.set_item(6, 7, Disc.new('X'))
    @white_has_no_moves_board.set_item(7, 7, Disc.new('X'))
    @white_has_no_moves_board.set_item(3, 3, Disc.new('X'))
    @white_has_no_moves_board.set_item(5, 0, Disc.new('X'))
    @white_has_no_moves_board.set_item(6, 0, Disc.new('X'))
    @white_has_no_moves_board.set_item(7, 0, Disc.new('X'))
    @white_has_no_moves_board.set_item(5, 6, Disc.new('X'))
    @white_has_no_moves_board.set_item(6, 6, Disc.new('X'))
    @white_has_no_moves_board.set_item(7, 6, Disc.new('X'))
    @white_has_no_moves_board.set_item(6, 5, Disc.new('X'))
    @white_has_no_moves_board.set_item(7, 5, Disc.new('X'))
    @white_has_no_moves_board.set_item(7, 4, Disc.new('X'))
    # Set the 25 white discs.
    @white_has_no_moves_board.set_item(2, 1, Disc.new('O'))
    @white_has_no_moves_board.set_item(5, 1, Disc.new('O'))
    @white_has_no_moves_board.set_item(2, 2, Disc.new('O'))
    @white_has_no_moves_board.set_item(3, 2, Disc.new('O'))
    @white_has_no_moves_board.set_item(4, 2, Disc.new('O'))
    @white_has_no_moves_board.set_item(5, 2, Disc.new('O'))
    @white_has_no_moves_board.set_item(6, 2, Disc.new('O'))
    @white_has_no_moves_board.set_item(1, 3, Disc.new('O'))
    @white_has_no_moves_board.set_item(2, 3, Disc.new('O'))
    @white_has_no_moves_board.set_item(4, 3, Disc.new('O'))
    @white_has_no_moves_board.set_item(5, 3, Disc.new('O'))
    @white_has_no_moves_board.set_item(6, 3, Disc.new('O'))
    @white_has_no_moves_board.set_item(7, 3, Disc.new('O'))
    @white_has_no_moves_board.set_item(2, 4, Disc.new('O'))
    @white_has_no_moves_board.set_item(3, 4, Disc.new('O'))
    @white_has_no_moves_board.set_item(4, 4, Disc.new('O'))
    @white_has_no_moves_board.set_item(5, 4, Disc.new('O'))
    @white_has_no_moves_board.set_item(6, 4, Disc.new('O'))
    @white_has_no_moves_board.set_item(2, 5, Disc.new('O'))
    @white_has_no_moves_board.set_item(3, 5, Disc.new('O'))
    @white_has_no_moves_board.set_item(4, 5, Disc.new('O'))
    @white_has_no_moves_board.set_item(5, 5, Disc.new('O'))
    @white_has_no_moves_board.set_item(2, 6, Disc.new('O'))
    @white_has_no_moves_board.set_item(3, 6, Disc.new('O'))
    @white_has_no_moves_board.set_item(4, 6, Disc.new('O'))
    
    # This game state is derived from 'white_has_no_moves_board'
    # so it's also a valid state and taken from a real game.
    @both_have_moves_board = Board.new
    # Set the 41 black discs.
    @both_have_moves_board.set_item(0, 0, Disc.new('X'))
    @both_have_moves_board.set_item(1, 0, Disc.new('X'))
    @both_have_moves_board.set_item(2, 0, Disc.new('X'))
    @both_have_moves_board.set_item(3, 0, Disc.new('X'))
    @both_have_moves_board.set_item(5, 0, Disc.new('X'))
    @both_have_moves_board.set_item(6, 0, Disc.new('X'))
    @both_have_moves_board.set_item(7, 0, Disc.new('X'))
    @both_have_moves_board.set_item(6, 1, Disc.new('X'))
    @both_have_moves_board.set_item(3, 2, Disc.new('X'))
    @both_have_moves_board.set_item(5, 2, Disc.new('X'))
    @both_have_moves_board.set_item(6, 2, Disc.new('X'))
    @both_have_moves_board.set_item(7, 2, Disc.new('X'))
    @both_have_moves_board.set_item(3, 3, Disc.new('X'))
    @both_have_moves_board.set_item(6, 3, Disc.new('X'))
    @both_have_moves_board.set_item(7, 3, Disc.new('X'))
    @both_have_moves_board.set_item(1, 4, Disc.new('X'))
    @both_have_moves_board.set_item(3, 4, Disc.new('X'))
    @both_have_moves_board.set_item(4, 4, Disc.new('X'))
    @both_have_moves_board.set_item(5, 4, Disc.new('X'))
    @both_have_moves_board.set_item(6, 4, Disc.new('X'))
    @both_have_moves_board.set_item(7, 4, Disc.new('X'))
    @both_have_moves_board.set_item(1, 5, Disc.new('X'))
    @both_have_moves_board.set_item(2, 5, Disc.new('X'))
    @both_have_moves_board.set_item(3, 5, Disc.new('X'))
    @both_have_moves_board.set_item(4, 5, Disc.new('X'))
    @both_have_moves_board.set_item(5, 5, Disc.new('X'))
    @both_have_moves_board.set_item(6, 5, Disc.new('X'))
    @both_have_moves_board.set_item(7, 5, Disc.new('X'))
    @both_have_moves_board.set_item(1, 6, Disc.new('X'))
    @both_have_moves_board.set_item(2, 6, Disc.new('X'))
    @both_have_moves_board.set_item(5, 6, Disc.new('X'))
    @both_have_moves_board.set_item(6, 6, Disc.new('X'))
    @both_have_moves_board.set_item(7, 6, Disc.new('X'))
    @both_have_moves_board.set_item(0, 7, Disc.new('X'))
    @both_have_moves_board.set_item(1, 7, Disc.new('X'))
    @both_have_moves_board.set_item(2, 7, Disc.new('X'))
    @both_have_moves_board.set_item(3, 7, Disc.new('X'))
    @both_have_moves_board.set_item(4, 7, Disc.new('X'))
    @both_have_moves_board.set_item(5, 7, Disc.new('X'))
    @both_have_moves_board.set_item(6, 7, Disc.new('X'))
    @both_have_moves_board.set_item(7, 7, Disc.new('X'))
    # Set the 20 white discs.
    @both_have_moves_board.set_item(4, 0, Disc.new('O'))
    @both_have_moves_board.set_item(0, 1, Disc.new('O'))
    @both_have_moves_board.set_item(2, 1, Disc.new('O'))
    @both_have_moves_board.set_item(3, 1, Disc.new('O'))
    @both_have_moves_board.set_item(5, 1, Disc.new('O'))
    @both_have_moves_board.set_item(7, 1, Disc.new('O'))
    @both_have_moves_board.set_item(0, 2, Disc.new('O'))
    @both_have_moves_board.set_item(2, 2, Disc.new('O'))
    @both_have_moves_board.set_item(4, 2, Disc.new('O'))
    @both_have_moves_board.set_item(0, 3, Disc.new('O'))
    @both_have_moves_board.set_item(1, 3, Disc.new('O'))
    @both_have_moves_board.set_item(2, 3, Disc.new('O'))
    @both_have_moves_board.set_item(4, 3, Disc.new('O'))
    @both_have_moves_board.set_item(5, 3, Disc.new('O'))
    @both_have_moves_board.set_item(0, 4, Disc.new('O'))
    @both_have_moves_board.set_item(2, 4, Disc.new('O'))
    @both_have_moves_board.set_item(0, 5, Disc.new('O'))
    @both_have_moves_board.set_item(0, 6, Disc.new('O'))
    @both_have_moves_board.set_item(3, 6, Disc.new('O'))
    @both_have_moves_board.set_item(4, 6, Disc.new('O'))
    
    # dup and clone methods applied to @both_have_moves_board keep a reference to
    # the original object and thus the changes below modify it and the already
    # working tests fail.
    @none_has_moves_board = Marshal::load(Marshal.dump(@both_have_moves_board))
    @none_has_moves_board.set_item(1, 1, Disc.new('X'))
    @none_has_moves_board.set_item(2, 2, Disc.new('X'))
    @none_has_moves_board.set_item(4, 1, Disc.new('O'))
    @none_has_moves_board.set_item(3, 2, Disc.new('O'))
    @none_has_moves_board.set_item(1, 2, Disc.new('X'))
    @none_has_moves_board.set_item(1, 3, Disc.new('X'))
    @none_has_moves_board.set_item(2, 1, Disc.new('X'))
    @none_has_moves_board.set_item(2, 2, Disc.new('X'))
    @none_has_moves_board.set_item(2, 3, Disc.new('X'))
  end
  
  # Tests method get_valid_moves(color, board)
  def test_get_valid_moves
    assert_equal [], @game_logic.get_valid_moves('X', @empty_board)
    assert_equal [], @game_logic.get_valid_moves('O', @empty_board)
    
    assert_equal [], @game_logic.get_valid_moves('X', @only_black_discs_board)
    assert_equal [], @game_logic.get_valid_moves('O', @only_black_discs_board)
    
    assert_equal [], @game_logic.get_valid_moves('O', @only_white_discs_board)
    assert_equal [], @game_logic.get_valid_moves('X', @only_white_discs_board)
    
    assert_equal [], @game_logic.get_valid_moves('O', @white_has_no_moves_board)
    assert_equal false, @game_logic.get_valid_moves('X', @white_has_no_moves_board).empty?
    
    assert_equal false, @game_logic.get_valid_moves('X', @both_have_moves_board).empty?
    assert_equal false, @game_logic.get_valid_moves('O', @both_have_moves_board).empty?
    
    assert_equal true, @game_logic.get_valid_moves('X', @none_has_moves_board).empty?
    assert_equal true, @game_logic.get_valid_moves('O', @none_has_moves_board).empty?
  end
  
  # Tests public method game_over(board)
  def test_game_over
    assert_equal true, @game_logic.game_over(@empty_board)
    assert_equal true, @game_logic.game_over(@only_black_discs_board)
    assert_equal true, @game_logic.game_over(@only_white_discs_board)
    assert_equal false, @game_logic.game_over(@white_has_no_moves_board)
    assert_equal false, @game_logic.game_over(@both_have_moves_board)
    assert_equal true, @game_logic.game_over(@none_has_moves_board)
  end
end

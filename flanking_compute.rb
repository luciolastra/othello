# Stores the origin from which the move originates, the position
# where the new disc can be placed to make the move (destination), as well
# as the direction offset and amount of the opponent's discs in the path of
# the move.
#
# It's created by the GameLogic object in its private method <b>find_all_moves</b>
# to store a calculation once a valid move is found and then used in GameLogic 's 
# <b>flank_opponent_discs</b> method to flank opponent discs once the player has 
# picked a move.

class FlankingCompute
  # Getter and setter.
  attr_accessor :origin, :destination, :direction_offset, :disc_count
end

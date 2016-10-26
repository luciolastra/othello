# Simple player class.

class Player
  # Getter
  attr_reader :name, :color

  # Creates a player.
  #
  # <em>Params:</em>
  # +name+:: String - player's name
  # +color+:: String - player's color
  def initialize(name, color)
    @name = name
    @color = color
  end

  # Used when the player has to pick a move. It just prints a message
  # and waits until the player enters the coordinate of his/her next move.
  def make_move()
    puts
    print "Please select a valid move. (i.e.: (1,5) is 15): "
    gets.chomp
  end
end

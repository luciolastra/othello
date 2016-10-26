# Represents the board of the game.

require_relative "grid_container"
require_relative "empty_position"
require_relative "disc"

class Board < GridContainer
  # Creates an 8 x 8 board full of EmptyPosition (stub) objects. Then sets
  # the four initial discs in the starting positions of the game.
  def initialize
    super(8, 8)
    8.times do |row|
      8.times do |column|
        set_item(row, column, EmptyPosition.new)
      end
    end
    set_item(3, 3, Disc.new("O"))
    set_item(3, 4, Disc.new("X"))
    set_item(4, 3, Disc.new("X"))
    set_item(4, 4, Disc.new("O"))
  end

  # Displays the board with all the discs.
  def display
    puts
    puts "    0 1 2 3 4 5 6 7 "
    puts "   -----------------"
    8.times do |row|
      print " #{row} |"
      8.times do |column|
        get_item(row, column).display
      end
      puts
    end
    puts "   -----------------"
    puts
  end
end

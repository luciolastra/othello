# Class in charge of the game's logic and rules.

require_relative "board"
require_relative "coordinate"
require_relative "flanking_compute"

class GameLogic
  # Flanks the opponent's discs.
  #
  # <b>moves</b> is an array of arrays. Each array inside <b>moves</b> represents
  # a possible origin. Each origin has one or more FlankingCompute objects that store
  # the valid destination coordinate for the move, the direction offset and the disc
  # count of the opponent discs to flank.
  #
  # <em>Params:</em>
  # +user_move_coord+:: +Coordinate+ - coordinate of the player's move
  # +moves+:: Array - contains all the available moves
  # +board+:: Board - the game's board
  # +color+:: String - the color of the current player making the move
  def flank_opponent_discs(user_move_coord, moves, board, color)    
    moves.each do |origin|
      origin.each do |comp|
        if (comp.destination.x == user_move_coord.x) && (comp.destination.y == user_move_coord.y)
          x = comp.origin.x
          y = comp.origin.y
          
          comp.disc_count.times do
            x += comp.direction_offset.x
            y += comp.direction_offset.y
            board.set_item(x, y, Disc.new(color))
          end
          board.set_item(comp.destination.x, comp.destination.y, Disc.new(color))
        end
      end
    end
  end
  
  # Finds all possible moves of a disc.
  #
  # <em>Params:</em>
  # +origin+:: Coordinate - coordinate of a player's origin disc
  # +color+:: String - the player's color
  # +board+:: Board - the game's board
  def find_all_moves(origin, color, board)
    disc_moves = []
    offset_directions = [[-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1]]

    # Tests in each of the eight adjacent positions of a disc whether there's a valid move
    # and in that case saves it as a FlankingCompute object.
    offset_directions.each do |offset|
      new_x = origin.x
      new_y = origin.y
      
      cell_is_empty = false
      same_color_in_path = false
      opponent_discs = 0
      
      while ((cell = board.get_item(new_x + offset[0], new_y + offset[1])) != nil) && !cell_is_empty && !same_color_in_path
        new_x += offset[0]
        new_y += offset[1]
  
        unless cell.is_a?(EmptyPosition)
          if color != cell.color
            opponent_discs += 1
          else
            same_color_in_path = true
          end
        else
          cell_is_empty = true
        end
      end

      if cell_is_empty && !same_color_in_path && opponent_discs >= 1
        compute = FlankingCompute.new
        compute.origin = origin
        compute.destination = Coordinate.new(new_x, new_y)
        compute.direction_offset = Coordinate.new(offset[0], offset[1])
        compute.disc_count = opponent_discs

        disc_moves << compute
      end
    end
    disc_moves
  end
  
  # Finds the coordinates of all the discs of a certain color in the board.
  #
  # <em>Params:</em>
  # +board+:: Board - the game's board
  # +color+:: the player's color
  def find_all_disc_coords(color, board)
    all_coords = []

    8.times do |row|
      8.times do |column|
        disc = board.get_item(row, column)

        unless disc.is_a?(EmptyPosition)
          if disc.color == color
            all_coords << Coordinate.new(row, column)
          end
        end
      end
    end
    all_coords
  end
  
  # Gets all the player valid moves.
  #
  # <em>Params:</em>
  # +board+:: Board - the game's board
  # +color+:: the player's color
  def get_valid_moves(color, board)
    all_player_disc_coords = find_all_disc_coords(color, board)
    moves = []
    
    if all_player_disc_coords != []
      all_player_disc_coords.each do |coord|
        all_disc_moves = find_all_moves(coord, color, board)
        if all_disc_moves != []
          moves << all_disc_moves
        end 
      end
    end
    moves
  end
  
  # Determines if the game is over.
  #
  # <em>Params:</em>
  # +board+:: Board - the game's board
  def game_over(board)
    get_valid_moves('X', board).empty? && get_valid_moves('O', board).empty?
  end

  # Transforms the user input in a coordinate if the input is valid.
  #
  # <em>Params:</em>
  # +move+:: String - user input  
  def transform_user_move_into_coordinate(move)
    digits = ('0'..'9').to_a
    if move.is_a?(String) && move.size == 2
      if digits.include?(move[0]) && digits.include?(move[1])
        Coordinate.new(move[0].to_i, move[1].to_i)
      end
    end
  end
  
  # Displays the final score.
  #
  # <em>Params:</em>
  # +board+:: Board - the game's board
  def display_final_score(board)
    player1_disc_count = find_all_disc_coords('X', board).size
    player2_disc_count = find_all_disc_coords('O', board).size
    
    if player1_disc_count > player2_disc_count
      msg = "Player 1! - #{player1_disc_count} discs vs. #{player2_disc_count} discs."
    elsif player1_disc_count < player2_disc_count
      msg = "Player 2! - #{player2_disc_count} discs vs. #{player1_disc_count} discs."
    else
      msg = "Wow it's a draw! - Player 1: #{player1_disc_count} discs - Player 2: #{player2_disc_count} discs."
    end
    puts
    puts "#### Game's over and the winner is..."
    puts
    puts msg
    puts
  end
  
  # Executes one player's move once the move is valid. Then flanks the
  # opponent's discs accordingly.
  #
  # <em>Params:</em>
  # +player+:: Player - one of the players
  # +board+:: Board - the game's board
  # +moves+:: Array - valid moves for the user in the game's current state
  def execute_player_move(player, board, moves)
    begin
      user_picked_correct_move = false
      
      user_move = player.make_move()
      user_move_coord = transform_user_move_into_coordinate(user_move)
              
      if user_move_coord != nil && board.valid_position?(user_move_coord.x, user_move_coord.y)
        moves.each do |origin|
          origin.each do |comp|
            if comp.destination.x === user_move_coord.x && comp.destination.y == user_move_coord.y
              user_picked_correct_move = true
              break
            end
          end
          break if user_picked_correct_move
        end          
      end
    end until user_picked_correct_move

    puts
    puts "You picked: (#{user_move_coord.x}, #{user_move_coord.y})"
    puts
    
    flank_opponent_discs(user_move_coord, moves, board, player.color)
  end
  
  private :find_all_disc_coords, :find_all_moves, :transform_user_move_into_coordinate, :flank_opponent_discs
end

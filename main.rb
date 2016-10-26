# Runs the program.

require_relative "board"
require_relative "disc"
require_relative "player"
require_relative "game_logic"

# Displays welcome message.
def welcome_message
  puts
  puts "-------------------"
  puts "Welcome to Othello!"
  puts "-------------------"
  puts
end

# Main

welcome_message 

board = Board.new

players = {}
players["Player 1"] = Player.new("Player 1", "X")
players["Player 2"] = Player.new("Player 2", "O")

game_logic = GameLogic.new

begin
    for player in players.keys
      puts "#{player}'s (#{players[player].color}) turn"
      board.display
      
      moves = game_logic.get_valid_moves(players[player].color, board)
      
      if not moves.empty?
        game_logic.execute_player_move(players[player], board, moves)
      else
        puts "Sorry #{player}, you don't have available moves."
      end
    end
end until game_logic.game_over(board)

puts
board.display
puts

game_logic.display_final_score(board)

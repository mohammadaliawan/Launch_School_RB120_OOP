# Tic Tac Toe

Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns marking a square. The first player to mark 3 squares in a row wins.

Nouns: player, square, board, game, grid, 
Verbs: play, mark

Player
- mark
Square
Board
Game
- Play

## Spike

```ruby
class Board
  def initialize
    # need some way to model the 3x3 grid, maybe @squares
    #what data dtructure
    # array of arrays?
    # hash of arrays
    # array of strings "X", "O"
    # array of integers
  end
end

class Player
  def initialize
    # name, symbol, 

  end

  def mark

  end
end

class Square
  def initialize
    # status
  end
end

class TTTGame
  def initialize
    # human_player, computer_player, Board
  end

  def play
    display_welcome_message
    loop do
      first_player_moves
      break if someone_won? || board_full?
      
      second_player_moves
      break if someone_won? || board_full?
    end

    display_result
    display_goodbye
  end
end


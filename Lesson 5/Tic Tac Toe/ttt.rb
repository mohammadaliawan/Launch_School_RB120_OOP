class Board
  WINNING_LINES = [
    [1,2,3], [4,5,6], [7,8,9],
    [1,4,7], [2,5,8], [3,6,9],
    [1,5,9], [3,5,7]
  ]

  def initialize
    @squares = {}
    (1..9).each {|key| @squares[key] = Square.new}
  end

  def [](square_num)
    @squares[square_num]
  end

  def []=(square_num, marker)
    @squares[square_num].marker = marker
  end

  def unmarked_keys
    @squares.select{|_, sq| sq.unmarked?}.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!detect_winner
  end

  # For each of the winning lines
    # if all the square object markers are human marker
      # return human marker
    # if all the square object markers are computer markers
      # return computer marker
    # else return nil
  def detect_winner
    WINNING_LINES.each do |line|
      if line.all?{|key| self[key].marker == Human::MARKER}
        return Human::MARKER
      elsif line.all?{|key| self[key].marker == Computer::MARKER}
        return Computer::MARKER
      end
    end
    return nil
  end
end

class Square
  INITIAL_MARKER = " "
  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    @marker == INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker
  def initialize
    @marker = self.class::MARKER
  end
end

class Human < Player
  MARKER = "X"
end

class Computer < Player
  MARKER = "O"
end

class TTTGame
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new

  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    system('clear')
    puts "You are a #{human.marker}. Computer is a #{computer.marker}"
    puts ""
    puts "     |     |"
    puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
    puts "     |     |"
    puts ""
  end

  def human_moves
    puts "Choose a square:(#{board.unmarked_keys.join(', ')}) "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, not a valid choice"
    end
    board[square] = human.marker
  end

  def computer_moves
    square = board.unmarked_keys.sample
    board[square] = computer.marker
  end 

  def display_result
    display_board

    if board.detect_winner == human.marker
      puts "You won"
    elsif board.detect_winner == computer.marker
      puts "Computer won!"
    else
      puts "The board is full! Its a tie!"
    end
  end

  def play
    display_welcome_message
    display_board
    loop do
      human_moves
      break if board.full? || board.someone_won?

      computer_moves
      break if board.full? || board.someone_won?

      display_board
    end
    display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
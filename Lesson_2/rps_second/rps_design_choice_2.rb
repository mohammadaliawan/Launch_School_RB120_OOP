require 'pry'

module Compare
  def >(other_move)
    (self.value == "rock" && other_move.value == "scissors") ||
      (self.value == "rock" && other_move.value == "lizard") ||
      (self.value == "paper" && other_move.value == "rock") ||
      (self.value == "paper" && other_move.value == "spock") ||
      (self.value == "lizard" && other_move.value == "spock") ||
      (self.value == "lizard" && other_move.value == "paper") ||
      (self.value == "spock" && other_move.value == "rock") ||
      (self.value == "spock" && other_move.value == "scissors") ||
      (self.value == "scissors" && other_move.value == "paper") ||
      (self.value == "scissors" && other_move.value == "lizard")
  end
end

class Move
  MOVES = %w(rock paper scissors lizard spock)
  attr_reader :value

  include Compare

  def to_s
    @value
  end
end

class Rock < Move
  def initialize
    @value = "rock"
  end
end

class Paper < Move
  def initialize
    @value = "paper"
  end
end

class Scissors < Move
  def initialize
    @value = "scissors"
  end
end

class Lizard < Move
  def initialize
    @value = "lizard"
  end
end

class Spock < Move
  def initialize
    @value = "spock"
  end
end

class Score
  attr_reader :value

  def initialize
    @value = 0
  end

  def increment
    @value += 1
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    self.name = set_name
    self.score = Score.new
    self.move = Move.new
  end
    
  def set_name
    ""
  end

  def update_score
    score.increment
  end
end

class Human < Player
  def choose
    # binding.pry
    case human_choice
    when "rock"
      self.move = Rock.new
    when "paper"
      self.move = Paper.new
    when "scissors"
      self.move = Scissors.new
    when "lizard"
      self.move = Lizard.new
    when "spock"
      self.move = Spock.new
    end
  end

  def set_name
    n = ""
    loop do
      puts "Enter your name:"
      n = gets.chomp.capitalize
      break unless n.empty?
      puts " Please enter a value!"
    end
    n
  end

  private

  def human_choice
    choice = nil
    loop do
      puts "Please choose: #{Move::MOVES.join(', ')}!"
      choice = gets.chomp
      break if Move::MOVES.include?(choice)
      puts "Input Error! Please enter: #{Move::MOVES.join(', ')}"
    end
    choice
  end
end

class Computer < Player
  def choose
    computer_choice = Move::MOVES.sample
    case computer_choice
    when "rock"
      self.move = Rock.new
    when "paper"
      self.move = Paper.new
    when "scissors"
      self.move = Scissors.new
    when "lizard"
      self.move = Lizard.new
    when "spock"
      self.move = Spock.new
    end
  end

  def set_name
    %w(Chappie R2D2 C3PO).sample
  end
end

class RPSGame
  WINNING_SCORE = 5

  attr_accessor :human, :computer, :winner

  def initialize
    self.human = Human.new
    self.computer = Computer.new
  end

  def display_score
    puts "#{human.name}'s Score: #{human.score.value}"
    puts "#{computer.name}'s Score: #{computer.score.value}"
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        system('clear')
        display_moves
        winner.update_score if winner
        display_winner
        display_score
        break if someone_won?
      end
      display_grand_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def winner
    if human.move > computer.move
      human
    elsif computer.move > human.move
      computer
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Incorrect input. Enter y or n"
    end
    answer == "y"
  end

  def someone_won?
    human.score.value == WINNING_SCORE ||
      computer.score.value  == WINNING_SCORE
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing. Goodbye!"
  end

  def display_winner
    if winner == human
      puts "#{human.name} won this round!"
    elsif winner == computer
      puts "#{computer.name} won this round!"
    else
      puts "Its a tie!"
    end
  end

  def display_grand_winner
    if human.score.value == WINNING_SCORE
      puts "#{human.name} is the grand winner!" 
    else
      puts "#{computer.name} is the grand winner"
    end
  end

  def display_moves
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
  end
end

RPSGame.new.play

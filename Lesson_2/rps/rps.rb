class RpsGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to the Rock, Paper, Scissors, Lizard, Spock Game!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won this round!"
      human.score.add_one
    elsif human.move < computer.move
      puts "#{computer.name} won this round!"
      computer.score.add_one
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = ""
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end
    return true if answer == 'y'
    false
  end

  def display_score
    puts "#{human.name} score = #{human.score}\n#{computer.name} score = #{computer.score}"
  end

  def display_final_winner
    puts "#{human.name} Wins the Game!" if human.score.value == Score::TO_WIN
    puts "#{computer.name} Wins the Game" if computer.score.value == Score::TO_WIN
  end

  def reset_score
    human.score.value = 0
    computer.score.value = 0
  end

  def play
    display_welcome_message
    loop do
      while human.score.value < Score::TO_WIN && computer.score.value < Score::TO_WIN
        human.choose
        computer.choose
        display_moves
        display_winner
        display_score
      end
      display_final_winner
      reset_score
      break unless play_again?
    end
    display_goodbye_message
  end
end

class Move
  VALUES = %w(rock paper scissors lizard spock)

  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end

  def rock?
    @value == "rock"
  end

  def paper?
    @value == "paper"
  end

  def scissors?
    @value == "scissors"
  end

  def lizard?
    @value == "lizard"
  end

  def spock?
    @value == "spock"
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?) ||
      (lizard? && other_move.spock?) ||
      (paper? && other.move.spock?) ||
      (rock? && other_move.lizard?) ||
      (spock? && other_move.scissors?) ||
      (scissors? && other_move.lizard?) ||
      (lizard? && other_move.paper?) ||
      (spock? && other_move.rock?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?) ||
      (spock? && other_move.lizard?) ||
      (spock? && other_move.paper?) ||
      (lizard? && other_move.rock?) ||
      (scissors? && other_move.spock?) ||
      (lizard? && other_move.scissors?) ||
      (paper? && other_move.lizard?) ||
      (rock? && other_move.spock?)
  end
end

class Score
  TO_WIN = 2
  attr_accessor :value

  def initialize
    @value = 0
  end

  def add_one
    self.value = self.value + 1
  end

  def to_s
    @value.to_s
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    @move = nil
    @name = set_name
    @score = Score.new
  end
end

class Human < Player
  def set_name
    name = ""
    loop do
      puts "What is your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Please input a valid name!"
    end
    self.name = name
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard or spock:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice. Try again."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = %w(R2D2 C3PO).sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

RpsGame.new.play

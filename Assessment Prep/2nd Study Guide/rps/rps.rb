class Player
  attr_accessor :name, :move, :score

  def initialize
    set_name
    self.score = 0
  end
end

class Human < Player
  def set_name
    loop do
      puts "Enter your name?"
      self.name = gets.chomp
      break unless name.empty?
      puts "Must enter something!"
    end
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper or scissors"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Incorrect input!!"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  NAMES = %w(R2D2 Chappie Hal)

  def set_name
    self.name = Computer::NAMES.sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  VALUES = %w(rock paper scissors lizard spock)

  def initialize(value)
    @value = value
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

  def to_s
    @value
  end

  def >(other_move)
    rock? && other_move.scissors? ||
      scissors? && other_move.paper? ||
      paper? && other_move.rock?
  end

  def <(other_move)
    rock? && other_move.paper? ||
      scissors? && other_move.rock? ||
      paper? && other_move.scissors?
  end
end

class RPSGame
  WINNING_SCORE = 3
  attr_accessor :human, :computer, :round_winner, :grand_winner

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play_again?
    answer = ""
    loop do
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp
      break if %w(y n).include?(answer)
      puts "Sorry, must enter y or n!"
    end
    return false if answer == "n"
    return true if answer == "y"
  end

  def update_score
    case round_winner
    when human then human.score += 1
    when computer then computer.score += 1
    end
  end

  def display_grand_winner
    if human.score == RPSGame::WINNING_SCORE
      puts "#{human.name} is the grand winner!"
    elsif computer.score == RPSGame::WINNING_SCORE
      puts "#{computer.name} is the grand winner!"
    end
  end

  def display_score
    puts "#{human.name}: #{human.score} points   #{computer.name}: #{computer.score}"
  end

  def end_round
    system('clear')
    display_moves
    display_winner
    puts "------------------------------------------------------------"
    display_score
  end

  def play
    system('clear')
    display_welcome_message
    loop do
      human.choose
      computer.choose
      find_winner
      update_score
      end_round
      break if someone_won?
    end

    display_grand_winner
    display_goodbye
  end

  def someone_won?
    human.score == RPSGame::WINNING_SCORE ||
      computer.score == RPSGame::WINNING_SCORE
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    case round_winner
    when human then puts "#{human.name} won this round!"
    when computer then puts "#{computer.name} won this round!"
    else puts "Its a tie"
    end
  end

  def find_winner
    if human.move > computer.move
      self.round_winner = human
    elsif human.move < computer.move
      self.round_winner = computer
    else
      self.round_winner = nil
    end
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye
    puts "Thanks for playing!"
  end
end

RPSGame.new.play

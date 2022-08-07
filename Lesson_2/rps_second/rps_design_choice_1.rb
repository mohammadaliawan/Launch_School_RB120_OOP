class Player
  MOVES = ["rock", "paper", "scissors"]

  attr_accessor :move, :name

  def initialize
    self.name = set_name 
  end

  def set_name
    "Bobby"
  end
end

class Human < Player
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

  def retrieve_human_choice
    choice = nil
    loop do
      puts "Please choose: #{Player::MOVES.join(", ")}!"
      choice = gets.chomp
      break if Player::MOVES.include?(choice)
      puts "Input Error! Please enter either rock, paper or scissors"
    end
    choice
  end

  def choose
    self.move = retrieve_human_choice
  end
end

class Computer < Player
  def choose
    self.move = Player::MOVES.sample
  end

  def set_name
    %w(Chappie R2D2 C3PO).sample
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    self.human = Human.new
    self.computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing. Goodbye!"
  end

  def display_winner
    puts "Winner is ..."
  end

  def display_winner
    puts "#{human.name} Chose: #{human.move}, Computer Chose: #{computer.move}"
    case human.move
    when "rock"
      puts "Its a tie!" if computer.move == "rock"
      puts "#{human.name} won!" if computer.move == "scissors"
      puts "Computer won!" if computer.move == "paper"
    when "paper"
      puts "Its a tie!" if computer.move == "paper"
      puts "#{human.name} won!" if computer.move == "rock"
      puts "Computer won!" if computer.move == "scissors"
    when "scissors"
      puts "Its a tie!" if computer.move == "scissors"
      puts "#{human.name} won!" if computer.move == "paper"
      puts "Computer won!" if computer.move == "rock"
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

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
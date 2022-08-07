class Player
  MOVES = ["Rock", "Paper", "Scissors"]

  attr_accessor :move, :name

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
  end

  def retrieve_human_choice
    choice = nil
    loop do
      puts "Please choose #{MOVES.join(", ")}!"
      choice = gets.chomp
      break if MOVES.include?(choice)
      puts "Input Error! Please enter either rock, paper or scissors"
    end
    choice
  end

  def choose
    if human?
      self.move = retrieve_human_choice
    else
      self.move = MOVES.sample
    end
  end

  def human?
    @player_type == :human
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    self.human = Player.new(:human)
    self.computer = Player.new(:computer)
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
    when "Rock"
      puts "Its a tie!" if computer.move == "Rock"
      puts "#{human.name} won!" if computer.move == "Scissors"
      puts "Computer won!" if computer.move == "Paper"
    when "Paper"
      puts "Its a tie!" if computer.move == "Paper"
      puts "#{human.name} won!" if computer.move == "Rock"
      puts "Computer won!" if computer.move == "Scissors"
    when "Scissors"
      puts "Its a tie!" if computer.move == "Scissors"
      puts "#{human.name} won!" if computer.move == "Paper"
      puts "Computer won!" if computer.move == "Rock"
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

  def retrieve_player_name
    puts "What is your name?"
    human.name = gets.chomp.capitalize
  end

  def play
    display_welcome_message
    retrieve_player_name
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
class Player
  MOVES = ["Rock", "Paper", "Scissors"]

  attr_accessor :move

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

class Move
  def initialize

  end
end

class Rule
  def initialize

  end

end

def compare(move1, move2)

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
    puts "You Chose: #{human.move}, Computer Chose: #{computer.move}"
    case human.move
    when "Rock"
      puts "Its a tie!" if computer.move == "Rock"
      puts "You won!" if computer.move == "Scissors"
      puts "Computer won!" if computer.move == "Paper"
    when "Paper"
      puts "Its a tie!" if computer.move == "Paper"
      puts "You won!" if computer.move == "Rock"
      puts "Computer won!" if computer.move == "Scissors"
    when "Scissors"
      puts "Its a tie!" if computer.move == "Scissors"
      puts "You won!" if computer.move == "Paper"
      puts "Computer won!" if computer.move == "Rock"
    end
  end

  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    display_goodbye_message
  end
end

RPSGame.new.play
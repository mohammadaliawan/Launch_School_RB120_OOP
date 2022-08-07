module Viewable
  def clear_screen
    prompt "Press any key to continue."
    gets.chomp
    system 'clear'
  end

  def prompt(msg)
    puts ">> #{msg}"
  end
end

module Constants
  COUNT_TO_WIN = 3
  COMPUTER_NAMES = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']
  OPTIONS = { 'r' => 'rock', 'p' => 'paper', 'sc' => 'scissors',
              'l' => 'lizard', 'sp' => 'Spock' }
  RULES = <<-MSG
     ------Rules------
    Scissors cuts paper,
    paper covers rock,
    rock crushes lizard,
    lizard poisons Spock,
    Spock smashes scissors,
    scissors decapitates lizard,
    lizard eats paper,
    paper disproves Spock,
    Spock vaporizes rock,
    rock crushes scissors.
  MSG
end

module Moves
  class Move
    protected

    def scissors?
      @value == 'scissors'
    end

    def rock?
      @value == 'rock'
    end

    def paper?
      @value == 'paper'
    end

    def lizard?
      @value == 'lizard'
    end

    def spock?
      @value == 'Spock'
    end

    private

    attr_reader :value

    def to_s
      @value
    end
  end

  class Rock < Move
    def initialize
      @value = 'rock'
    end

    def >(other_move)
      other_move.scissors? ||
        other_move.lizard?
    end
  end

  class Paper < Move
    def initialize
      @value = 'paper'
    end

    def >(other_move)
      other_move.rock? ||
        other_move.spock?
    end
  end

  class Scissors < Move
    def initialize
      @value = 'scissors'
    end

    def >(other_move)
      other_move.paper? ||
        other_move.lizard?
    end
  end

  class Lizard < Move
    def initialize
      @value = 'lizard'
    end

    def >(other_move)
      other_move.paper? ||
        other_move.spock?
    end
  end

  class Spock < Move
    def initialize
      @value = 'Spock'
    end

    def >(other_move)
      other_move.rock? ||
        other_move.scissors?
    end
  end
end

class Player
  include Viewable
  attr_reader :name, :score

  def initialize
    @score = 0
    @moves = []
    set_name
  end

  def choose
    choice = select_move
    update_moves(choice)
  end

  def last_move
    moves.last
  end

  def all_moves
    moves.join(', ')
  end

  def win_match?
    score >= Constants::COUNT_TO_WIN
  end

  def reset
    self.moves = []
    self.score = 0
    system 'clear'
  end

  def increase_score
    self.score += 1
  end

  private

  def update_moves(choice)
    moves << case choice
             when 'r' then Moves::Rock.new
             when 'p' then Moves::Paper.new
             when 'sc' then Moves::Scissors.new
             when 'l' then Moves::Lizard.new
             when 'sp' then Moves::Spock.new
             end
  end

  attr_accessor :moves
  attr_writer :name
  attr_writer :score
end

class Human < Player
  private

  def set_name
    n = ''
    loop do
      system 'clear'
      puts ">> What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def select_move
    choice = nil
    loop do
      prompt "Choose one: #{Constants::OPTIONS.values.join(', ')}.
      Type 'r' for rock, 'p' for paper, 'sc' for scissors,
      'l' for lizard, or 'sp' for Spock:"
      choice = gets.chomp.downcase
      return choice if Constants::OPTIONS.keys.include? choice
      puts "Sorry, invalid choice."
    end
  end
end

class Computer < Player
  private

  def set_name
    self.name = Constants::COMPUTER_NAMES.sample
  end

  def select_move
    Constants::OPTIONS.keys.sample
  end
end

# Game Orchestration Engine
class RPSGame
  include Viewable

    def play_one_round
    human.choose
    computer.choose
    display_moves
    display_round_winner
    clear_screen
    update_score
    display_score
  end

  def play
    greeting
    loop do
      loop do
        play_one_round
        break if human.win_match? || computer.win_match?
      end
      display_match_winner
      play_again? ? reset_match_data : break
    end
    display_goodbye_message
  end

  private

  attr_reader :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Hi, #{human.name}! Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "First to win #{Constants::COUNT_TO_WIN} rounds wins the match!"
    puts
  end

  def display_rules
    answer = ''
    loop do
      prompt "Would you like to view the rules? (y/n)"
      answer = gets.chomp.downcase
      ['y', 'n'].include?(answer) ? break : puts("Sorry, must be 'y' or 'n'.")
    end

    system 'clear'
    return unless answer == 'y'
    puts Constants::RULES
    clear_screen
  end

  def display_goodbye_message
    system 'clear'
    puts "Thanks for playing! Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.last_move}."
    puts "#{computer.name} chose #{computer.last_move}."
  end

  def display_round_winner
    if human.last_move > computer.last_move
      puts "#{human.name} won!"
    elsif computer.last_move > human.last_move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_match_winner
    if human.win_match?
      puts "Congratulations! You've won the match!"
    else
      puts "Sorry! #{computer.name} has won the match!"
    end
  end

  def update_score
    if human.last_move > computer.last_move
      human.increase_score
    elsif computer.last_move > human.last_move
      computer.increase_score
    end
  end

  def display_score
    puts "-----Match Scoreboard-----"
    puts "#{human.name}: #{human.score}, #{computer.name}: #{computer.score}"
    puts "Your choice history: #{human.all_moves}"
    puts "Computer choice history: #{computer.all_moves}"
    puts
  end

  def play_again?
    answer = nil
    loop do
      prompt "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    answer.downcase == 'y'
  end

  def reset_match_data
    human.reset
    computer.reset
  end

  def greeting
    system 'clear'
    display_welcome_message
    display_rules
    system 'clear'
  end


end

RPSGame.new.play
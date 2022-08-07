# Object Oriented Rock Paper Scissors Game Initiatl Approach

## The classical approach to object oriented programming
  - Write a textual description of the problem or exercise
  - Extract the major nouns and verbs from the description
  - Organize and associate the verbs with the nouns
  - The nouns are the classes and the verbs are the behaviours or methods


## Textual description of the Problem

Rock, paper, scissors is a two player game where each player chooses one of three
possible moves: rock, paper or scissors. The chosen moves will then be compared to see who won, according to the following rules:

- rock beats scissors
- scissors beats paper
- paper beats rock

If the players chose the same move, then its a tie.

 Nouns: player, move, rule, game
 verbs: choose, compare

- Class RPSGame
  - Responsibilities
    - has a human player (@human = Human.new)
    - has a computer player (@computer = Computer.new)
    - can start and play a game (play)
      - display a welcome message
      - Keeps playing until a player reaches a score of WINNING_SCORE
        - human chooses move
        - computer chooses move
        - determine the winner
        - update score
        - display the winner
        - stop game if any score has reached 5
      - ask again?
  - Collaborators
    - Human
    - Computer

- Class Player
  - subclasses Human, Computer
  - Responsibilities
    - has a move
    - has a name (@name)
    - has a score (@score = Score.new)
  - Collaborators
    - Class Move
    - Class Score

- Class Score
  - Responsibilities
    - has a value (@value)
    - can increment the score by 1(increment)

- Class Human < Player
  - Responsibilities
    - can choose a move (choose)
  - Collaborators
    - Class Move (@move = Move.new)

- Class Computer < Player
  - Responsibilities
    - can choose a move (choose)
  - Collaborators
    - Class Move (@move = Move.new)

- Class Move
  - Responsibilities
    - has a value
    - can determine if less than other move (move < other_move)
    - can return a string representation (to_s)

- Class Rock
  - Reponsibilities
    - has a value
    - can return a string representation



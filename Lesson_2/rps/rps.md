# Rock Paper and Scissors

1. The user makes a choice.
2. The computer makes a choice.
3. The winner is displayed.

Classical approach to OOP:

- Write a textual description of the problem
- Extract the major nouns and verbs from the description
- Organize and associate the verbs with the nouns
- The nouns are the classes and the verbs are behaviours

Textual Description:

Rock, Paper, Scissors is a two-player game where each player chooses
one of three possible moves: rock, paper, or scissors. The chosen moves
will then be compared to see who wins, according to the following rules:

- rock beats scissors
- scissors beats paper
- paper beats rock

If the players chose the same move, then it's a tie.

Nouns:
- Rock, Paper, Scissors
- Player
- game
- move
- rule

Verbs:
- choose move
- compare moves
- wins

Classes:
- Move
  - compare moves
- Player
  - can choose move
- Game
  - Can determine the winner


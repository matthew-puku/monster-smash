## Monsters Smash terminal app

# Description
A collaboration between Matthew Puku and Rachel Wong, ‘Monsters Smash’ is a Ruby text adventure application built to explore principles of DRY scripting, modularisation, encapsulation, and object-oriented programming. This terminal application follows the common mechanics of popular turn-based games where users play against the computer by text-selecting a choice of “moves”. To win the game, the user must be the first to deplete the opponent’s (program) health score (HP). 

# Features
This is a single-player game where the user select “moves” via text-input in a series of turns against the computer. Both the user and computer start the game with maximum full health score (HP). And each selected ‘move’ by the user and the computer is calculated to deplete the opponent’s health score by a specific value. A series of checking gateways (control structures) continually checks and compares the health score (HP) of the user and computer to decide whether to advance the game further. The end goal for the user is to deplete the computer’s health score before his or her health score is exhausted. 

Prototype features
- Receive user text input to decide moves
- Establish ‘move’ objects each with speed and damage attributes
- Establish a character class ‘monster’ with attributes including current_HP, max_HP and to possess an array of moves 
- Display health scores of the user and computer
- Increment or subtract health scores from user and computer
- Compare health scores between user and computer (also catches errors and edge cases)
- Display welcome and quit screens
- Display victory and defeat screens with scores
- User can quit at any point of the running application

Users can only interact with this terminal application via keyboard input.

Extensible features
- Implement a best of 3 battle rounds
- User and computer can level-up as they advance to the next battle round
- Implement ASCII art for the welcome, victory, defeat screens
- Implement ASCII art for each move selected
- Allow for replay of battle rounds

# Build Status
The current product is a completed, functional proof-of-concept, with many extensible features identified by the team for future exploration. 

# Design and Planning progress

The team used lo-fi prototyping to map out user input and to decide upon the preliminary code structure. Much of the application workflow was blocked out on paper in one afternoon brainstorming session. 

The key difficulty faced by the team was in clarifying each step of a single battle (user input versus feedback loop), in ensuring the gameplay is supported by an appropriate amount of user feedback messages. 

# Testing

# Contribute

# Credits

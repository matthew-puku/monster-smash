# Monsters Smash Ruby Application

## Description
A collaboration between Matthew Puku and Rachel Wong, ‘Monsters Smash’ is a Ruby text adventure application built to explore principles of DRY scripting, modularisation, encapsulation, and object-oriented programming. This terminal application follows the common mechanics of popular turn-based games where users play against the computer by text-selecting a choice of “moves”. To win the game, the user must be the first to deplete the opponent’s (program) health score (HP). 

## Motivation
The team wanted to use the assessment opportunity to consolidate what was learnt so far in the Coder Academy bootcamp course using a fun, game-driven vehicle. 

Other non-game ideas to fulfil the assessment were also explored, such as

- A *journal app* which takes in user input as string with a daily mood category.

The user input will be parsed and searched for recurring keywords, which in turns trigger a ‘mood’ category. For example, a diary entry with multiple instances of words such as ‘fun’, ‘happy’, ‘satisfied’, ‘great’, ‘awesome’ will automatically generate a mood category of “Joy”. Inversely, an entry populated by ‘tired’, ‘exhausted’, ‘delay’, ‘moody’, ‘blue’ words could lead to a mood category of “Sad”. The mood category will be colour matched using the gem ‘colorize’.

- A *daily expense budgeting app*, which tabulates the variety of expenses incurred according to a tag system. User can input the name, description, cost, and assign a tag to each entry. The user can generate a table of weekly cost on command.

The turn-based game was chosen in the end as a great opportunity to combine high personal interest, coding challenge and project management possibilities. 

## Features and Functionality
This is a single-player game where the user select “moves” via text-input in a series of turns against the computer. Both the user and computer start the game with maximum full health score (HP). And each selected ‘move’ by the user and the computer is calculated to deplete the opponent’s health score by a specific value. A series of checking gateways (control structures) continually checks and compares the health score (HP) of the user and computer to decide whether to advance the game further. The end goal for the user is to deplete the computer’s health score before his or her health score is exhausted. 

### Prototype features
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

### Extensible features
- Implement a best of 3 battle rounds
- User and computer can level-up as they advance to the next battle round
- Implement ASCII art for the welcome, victory, defeat screens
- Implement ASCII art for each move selected
- Allow for replay of battle rounds

## Build Status
The current product is a completed, functional proof-of-concept, with many extensible features identified by the team for future exploration. 

## Instructions for use

1. Download and unzip the files on your local computer. 
2. In the terminal command line, navigate to the src folder by inputting the command "cd src"
3. Input the command "ruby main.rb", without the quotation marks. 
4. Program runs. 

## Design and Planning progress

The team used lo-fi prototyping to map out user input and to decide upon the preliminary code structure. Much of the application workflow was blocked out on paper in one afternoon brainstorming session. 

![alt text](https://github.com/matthew-puku/monster-smash/blob/master/images/CodeStructure2.JPG)
![alt text](https://github.com/matthew-puku/monster-smash/blob/master/images/UserInput_flowchart.JPG)

The key difficulty faced by the team was in clarifying each step of a single battle (user input versus feedback loop), in ensuring the gameplay is supported by an appropriate amount of user feedback messages. 

# Monster Smash Ruby Application

## Description
‘Monster Smash’ is a Ruby text adventure application built to explore principles of DRY scripting, modularisation, encapsulation, and object-oriented programming. This terminal application follows the common mechanics of popular turn-based games where users play against the computer by text-selecting a choice of “moves”. To win the game, the user must be the first to deplete the opponent’s (program) health score (HP). 

## Motivation
The team wanted to use the assessment opportunity to consolidate what was learnt so far in the Coder Academy bootcamp course using a fun and entertaining vehicle. 

Other non-game ideas to fulfil the assessment were also explored, such as

- A *journal app* which takes in user input as string with a daily mood category.

The user input will be parsed and searched for recurring keywords, which in turns trigger a ‘mood’ category. For example, a diary entry with multiple instances of words such as ‘fun’, ‘happy’, ‘satisfied’, ‘great’, ‘awesome’ will automatically generate a mood category of “Joy”. Inversely, an entry populated by ‘tired’, ‘exhausted’, ‘delay’, ‘moody’, ‘blue’ words could lead to a mood category of “Sad”. The mood category will be colour matched using the gem ‘colorize’.

- A *daily expense budgeting app*, which tabulates the variety of expenses incurred according to a tag system. User can input the name, description, cost, and assign a tag to each entry. The user can generate a table of weekly cost on command.

The turn-based game was chosen in the end as a great opportunity to combine high personal interest, coding challenge and project management possibilities. 

## Features and Functionality
This is a single-player game where the user select “moves” via text-input in a series of turns against the computer. Both the user and computer will begin the game with full health score (HP). And with each selected ‘move’, each player's health score (HP) will deplete by a specific damage count. In the case of a draw where both user and computer selects the exact same move, a speed advantage score will decide which move will deal a greater damage to HP. A series of checking gateways (control structures) continually checks and compares the health score (HP) of the user and computer to decide whether to advance the game further (victory, defeat or continue gameplay). The end goal for the user is to deplete the computer’s health score before his or her health score is exhausted. 

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

The key difficulty faced by the team was in clarifying each step of a single battle, what happens with each user input (move) versus computer feedback. 

## License

Copyright (c) 2019 Matthew Puku, Rachel Wong

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

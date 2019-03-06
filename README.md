# Monster Smash Ruby Application

## Description
**‘Monster Smash’** is a single-player, text adventure game built using Ruby to explore principles of DRY scripting, modularisation, encapsulation, and object-oriented programming. 

This terminal application follows the common mechanics of popular turn-based games where users play against the computer by text-selecting a choice of “moves”. To win the game, the user must be the first to deplete the opponent’s (computer) health score (HP). 

## Motivation
The team wanted to use this assignment opportunity to consolidate what was learnt so far in the Coder Academy bootcamp course using a fun and entertaining vehicle. 

Other project ideas were also explored, including

- A **journal app** which takes in user input as string with a daily mood category.The user input will be parsed and searched for recurring keywords, which in turns trigger a ‘mood’ category. 

For example, a diary entry with multiple instances of words such as ‘fun’, ‘happy’, ‘satisfied’, ‘great’, ‘awesome’ will automatically    generate a mood of “Joy”. Inversely, an entry populated by ‘tired’, ‘exhausted’, ‘delay’, ‘moody’, ‘blue’ words could lead to a mood category of “Sad”. The mood category will then be colour matched to the ruby gem ‘colorize’.

- A **daily expense budgeting app**, which tabulates all financial expenses incurred during a week using to a tag taxonomy. Users can input the name, description to a cost, and assign a tag to each entry. The user can generate a table of weekly cost on command.

The turn-based game was chosen in the end as a great opportunity to combine high personal interest, coding challenge and project management possibilities. 

## Features and Functionality
*Monster Smash* is a single-player game where the user select from an array of `@moves` via text-input in a series of turns against the computer. 

From the welcome screen, both the user and computer will start the game with full health score `@max_HP`. 

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/images/1.%20welcome_screen.png)

The user will be prompted to select a `move` to apply to the opponent. Both the user and computer players have a choice of four moves to 
play in each turn. 

Each user/computer has the following
- `@moves` a series of moves
- `dodge` attribute that will enable opponent's move to miss and not deplete their `@current_HP`


Each move has the following
- `speed` score that is compared against the opponent's. Whoever's `speed` score is higher will play the `move` first. 
- `damage` score that can deplete the opponent's `@current_HP` 
- `accuracy` score that will enable the `damage` to deplete the opponent's `@current_HP` 
- For the special **Leeching_bite** move, there is a `lifesteal_factor` which not only deals a damage score on the opponent's `@current_HP` but also increases the player's own `@current_HP` proportionate to the damage dealt.

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/images/step1.png)

And with each selected `move`, each player's health score `@current_HP` will deplete by a specific damage count. 

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/images/step2.png)

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/images/%20step%203.png)

In the case of a draw where both user and computer selects the exact same `move`, a speed advantage score will decide which move will deal a greater damage to `@current_HP`.

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/images/step%204.png)

A series of checking gateways (control structures) continually checks and compares the health score `@current_HP` of the user and computer to decide whether to advance the game further (victory, defeat or continue gameplay). 

The end goal for the user is to deplete the computer’s health score before his or her health score is exhausted. 

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/images/Won.png)

### Prototype features
- Receive user text input to decide moves
- Establish ‘move’ objects each with speed and damage attributes
- Establish a character class ‘monster’ with attributes including `@current_HP`, `@max_HP`, an array of `@moves` 
- Each `move` has unique `speed` and `damage` values which will deplete `@current_HP` at different rates
- A random numerical generator selects a move for the computer player, which includes a `miss` option that does not deplete `@current_HP` at all
- Display health scores of the user and computer
- Increment or subtract health scores from user and computer
- Compare health scores between user and computer (also catches errors and edge cases)
- Display welcome and quit screens
- Display victory and defeat screens with scores
- User can quit at any point of the running application
- Implemented ASCII art for the welcome, victory, defeat screens using a gem like [Artii](https://github.com/miketierney/artii) in `messages.rb`

Users can only interact with this terminal application via keyboard input.

### Extensible features
- Implement a best of 3 battle rounds in `battle.rb`
- User and computer can level-up as they advance to the next battle round. Possibly implement an control structure in `battle.rb`.
- Allow for replay of battle rounds in `battle.rb`
- More monster or characters can be created in `monster.rb`
- Different moves can be created in `moves.rb`
- Randomly choose a monster opponent to play against, which may require the creation of a new class like a gallery
- Allow the user to choose their own monster character, which again may require extending `main.rb` and or `battle.rb`
- Convert `@max_HP` and `@current_HP` into a visual progress bar using the gem [ruby-progressbar](https://github.com/jfelchner/ruby-progressbar)
- Implement ASCII art for each move selected using [Artii](https://github.com/miketierney/artii) in `monster.rb`
- Colorize the progress bar using the [Colorize](https://github.com/fazibear/colorize) ruby gem

## Code Structure

It was decided from early in the planning stage that the MVP will be structured in the following manner
* `main.rb` is the logic trigger to start the game. 
* `battle.rb` initialises a battle instance which will contain the gameplay mechanics of comparing `@current-HP`, and applying the move to a player. 
* `monster.rb` initialises a monster object which will have an array of `@moves`, `@max_HP` and `@current-HP` scores. It also enables behaviours such as display the series of `@moves` unique to the monster object, display menu of moves, enable user input to decide upon a `move`.  
* `move.rb` is a smaller class which simply initialises a `move` object, each with its own `speed` and `damage` values that can be applied to a player's `@current_HP` during gameplay. 

Towards the later stages of code refactoring, an additional class `messages.rb` was created to handle only displaying feedback screens such as the initial welcome screen, victory and defeat screens.

### Gems

The app made use of third-party gem (extensions) to enhance the graphical user interface experience:
* [Artii](https://github.com/miketierney/artii) for the ASCII word art
* [IO/Console](https://github.com/ruby/io-console) for function that allows the user to press any key to continue

## Build Status
The current product is a completed, functional proof-of-concept, with many extensible features identified by the team for future exploration. 

## Instructions for use

1. Follow these instructions to [download and install](https://www.ruby-lang.org/en/documentation/installation/) Ruby on your computer. 
2. Download and unzip the files on your local computer. 
3. On the terminal command line, navigate to the src folder. Install the bundler gem (if you haven't already) 
```
> install bundler
```
4. Ask bundle to install the gems that we use for the program. 
```
> bundle install 
```
5. In the terminal command line, navigate to the src folder by inputting the command 
  ```
  > cd src 
  ```
6. Input the below command in the terminal command line.  
  ```
  > ruby main.rb
  ```
7. If you get an error message like below asking you to update your bundler, input the below in terminal command line. 
![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/images/gemfile%20error.png)
  ```
  > gem update --system
  ```
8. Run program using step 6 again. 

## Design and Planning progress

The *Monster Smash* application was developed over approximately two and a half days between Matthew Puku and Rachel Wong. 

The team used lo-fi prototyping to map out user input and to decide upon the preliminary code structure. Much of the application workflow was blocked out on paper in one afternoon brainstorming session. 

![alt text](https://github.com/matthew-puku/monster-smash/blob/master/images/CodeStructure2.JPG)

Blocking out the objects and classes proved to be a relatively straight forward exercise. It was immediatley clear to the development team that separate classes are required for move, monster and battle with a `main.rb` as the external trigger to kickstart the program. 

The key difficulty faced by the team was in clarifying each step of a single battle, what happens with each user input (move) versus computer feedback. 

Refactoring the code to keep it extensible, readable for future development was a challenging exercise. 

Healthy time management was also difficult in maintaining a balance between researching for gems, deciding upon MVP functionalities, deciding which functionalities to relegate as 'nice-to-have' for future exploration.

## Record of Planning Progress
* [User Input Flowchart](https://github.com/matthew-puku/monster-smash/blob/master/images/UserInput_flowchart.JPG)
* [Early Objects and class](https://github.com/matthew-puku/monster-smash/blob/master/images/Code_structure.JPG)
* [Early Battle flow chart](https://github.com/matthew-puku/monster-smash/blob/master/images/BattleStructure.JPG)
* [Final Objects and Classes](https://github.com/matthew-puku/monster-smash/blob/master/images/Objects_classes.png)
* [User flow chart](https://github.com/matthew-puku/monster-smash/blob/master/images/flowchart.pdf)

## Project Timeline 

Project workload was distributed using [Trello](https://trello.com/b/mWeDQSQo/monster-battle-ruby-app), tracked alongside a dissection of the client brief (assignment rubric).

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/images/Trello1.png)

Planning, research and conceptualising the code structure was primarily achieved in one afternoon sitting by prototyping on paper. The coding was an iterative process spread across two afternoons between 5 March to 6 March.

## Testing

Rigorous user input testing was conducted to capture as many instances of edge cases as possible. A detailed listing of test cases can be reviewed [here](https://docs.google.com/spreadsheets/d/1XyPPReGf2S60YSt3XIqf5JUpHT3cRB2FRkK1rHgxnoI/edit#gid=0). 

Due to the time constraints of the project, user acceptance testing was not conducted. However, during the iterative development process, smaller unit testing was conducted with each new feature added. 

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/images/method_test_example.png)

## Accessibility

The [Web Content Accessibility Guidelines 2.0](https://www.w3.org/WAI/standards-guidelines/wcag/) was consulted adjacent to the coding process. All functionality of the content on *Monster Smash* is operable through a keyboard interface without requiring specific timings for individual keystrokes. There is sufficient clarity in the visual design (black and white) with clear, simple English instructions prompting user input at every step. 

However, the development team acknowledges that until the product has been live-tested with the target demographic users (focus group testing), it is not immediately clear whether *Monster Smash* has adequately catered for all users from a spectrum of ableness based on the [WCAG 2.0](https://www.w3.org/WAI/WCAG21/quickref/?versions=2.0).

## Copyright, ethical, social issues

As a text-based application with comparatively primitive controls (alphabetical), the development team did not foresee the application would raise any questions of moral, social, ethical consequences. 

Copyright issues were, however, discussed in terms of selecting an appropriate game character theme that is already in the public domain. The generic halloween monsters was eventually decided to circumvent copyright issues with using existing popular culture characters franchises (e.g.Pokemon). 

## License

**Copyright (c) 2019 Matthew Puku, Rachel Wong** for [Coder Academy](https://coderacademy.edu.au).

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

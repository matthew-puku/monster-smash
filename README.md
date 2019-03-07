# Monster Smash Ruby Application

Source code: https://github.com/matthew-puku/monster-smash

## Description
**‘Monster Smash’** is a single-player, text adventure game built using Ruby to explore principles of DRY scripting, modularisation, encapsulation, and object-oriented programming. 

This terminal application follows the common mechanics of popular turn-based games where users play against the computer by text-selecting a choice of “moves”. To win the game, the user must deplete the opponent’s (computer) health score (HP) before the computer depletes theirs. 

## Motivation
The team wanted to use this assignment opportunity to consolidate what was learnt within the first two weeks of [Coder Academy bootcamp course](https://coderacademy.edu.au/) using a fun and entertaining vehicle. 

Other project ideas were also explored, including

- A **journal app** which takes in user input as string with a daily mood category. The user input would be parsed and searched for recurring keywords, which in turn triggers a ‘mood’ category. 

For example, a diary entry with multiple instances of words such as ‘fun’, ‘happy’, ‘satisfied’, ‘great’, ‘awesome’ will automatically generate a mood of “Joy”. Inversely, an entry populated by ‘tired’, ‘exhausted’, ‘delay’, ‘moody’, ‘blue’ words could lead to a mood category of “Sad”. The mood category will then be colour matched to the ruby gem ‘colorize’.

- A **daily expense budgeting app**, which tabulates all financial expenses incurred during a week using to a tag taxonomy. Users can input the name, description to a cost, and assign a tag to each entry. The user can generate a table of weekly cost on command.

The turn-based game was chosen in the end as a great opportunity to combine high personal interest, coding challenge and project management possibilities. 

## Features and Functionality
*Monster Smash* is a single-player game where the user select from an array of `@moves` via text-input in a series of turns against the computer. 

From the welcome screen, both the user and computer will start the game with full health score `@max_HP`. 

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/docs/1.%20welcome_screen.png)

The user will be prompted to select a `move` to apply to the opponent. Both the user and computer players have a choice of moves to play each turn. 

Each user/computer has the following
- `HP`, which causes defeat if it falls below 0
- `dodge`, attribute that makes opponent's moves miss and have no effect
- `moves`, a list of moves available to use

Each move has the following
- `speed` score that is compared against the opponent's move. Whichever move has the higher `speed` score is will go first, sometimes ending the battle before the opponent can act.
- `accuracy` score that is combined with a random element and compared against a dodge score (usually the opponent's) to determine whether the move has any effect
- `damage` score that determines how much `HP` the opponent loses when the attack hits
- For the special **Leeching_bite** move, there is a `lifesteal_factor` which determines how much of the damage dealt by the move heals the user.

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/docs/step1.png)

Frank selects a move...

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/docs/step2.png)

...and deals damage

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/docs/%20step%203.png)

If the user and computer choose moves with the same speed, a tiebreak constant ensures the user goes first.

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/docs/step%204.png)

A series of checking gateways (control structures) continually checks and compares the health score `@current_HP` of the user and computer to decide whether to advance the game further (victory, defeat or continue gameplay). 

The end goal for the user is to deplete the computer’s health score before his or her health score is exhausted. 

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/docs/Won.png)

### Prototype features
- Receive user text input to decide moves
- Establish ‘move’ objects each with speed and damage attributes
- Establish a character class ‘monster’ with attributes including `@current_HP`, `@max_HP`, an array of `@moves` 
- Each `move` has unique `speed` and `damage` values which will deplete `@current_HP` at different rates
- A random numerical generator selects a move for the computer player
- Display health scores of the user and computer
- Increment or subtract health scores from user and computer
- Compare health scores between user and computer (also catches errors and edge cases)
- Display welcome and quit screens
- Display victory and defeat screens with scores
- User can quit at any point of the running application
- Implemented ASCII art for the welcome, victory, defeat screens using a the [Artii](https://github.com/miketierney/artii) gem in `messages.rb`

Users can only interact with this terminal application via keyboard input.

### Extensible features
The code was designed to be easily extensible. The code is highly modular and DRY, so the following features would be easy to implement.
- Chain multiple battles together in a gauntlet by altering `main.rb`
-- Allow user to "learn a move" from each monster they defeat, by creating a `loot.rb` file with the required logic
- Extra monsters e.g. skeleton, zombie in `monster.rb`
- Extra moves e.g. stat buffs, debuffs in `moves.rb`
- Randomly choose a monster opponent to play against, which may require the creation of a new class like a gallery (which might sort monsters according to difficulty or theme)
- Player vs. player combat
- Nicer visualisation of `@max_HP` and `@current_HP` using the gem [ruby-progressbar](https://github.com/jfelchner/ruby-progressbar)
- Implement ASCII art for each move selected using [Artii](https://github.com/miketierney/artii) in `monster.rb`
- Colorize the progress bar using the [Colorize](https://github.com/fazibear/colorize) ruby gem
- Colorize game text

## Code Structure

It was decided from early in the planning stage that the MVP will be structured in the following manner
* `main.rb` is the logic trigger to start the game. 
* `battle.rb` initialises a battle instance which will contain the gameplay mechanics of comparing `@current-HP`, and applying the move to a player. 
* `monster.rb` initialises a monster object which will have an array of `@moves`, `@max_HP` and `@current-HP` scores. It also enables behaviours such as display the series of `@moves` unique to the monster object, display menu of moves, enable user input to decide upon a `move`.  
* `move.rb` is a smaller class which simply initialises a `move` object, each with its own `speed` and `damage` values that can be applied to a player's `@current_HP` during gameplay. 

Towards the later stages of code refactoring, an additional file `messages.rb` was created to handle only displaying feedback screens such as the initial welcome screen, victory and defeat screens.

Splitting into multiple files made the code much easier to debug and enabled us to work on different things at the same time (parallelisation).

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
![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/docs/gemfile%20error.png)
  ```
  > gem update --system
  ```
8. Run program using step 6 again. 

## Design and Planning progress

The *Monster Smash* application was developed over approximately two and a half days by Matthew Puku and Rachel Wong. 

In the start, the team used lo-fi prototyping to map out user input and to decide upon the preliminary code structure. Much of the application workflow was blocked out on paper in one afternoon brainstorming session. 

![alt text](https://github.com/matthew-puku/monster-smash/blob/master/docs/CodeStructure2.JPG)

Blocking out the objects and classes proved to be a relatively straight forward exercise. It was immediatley clear to the development team that separate classes are required for move, monster and battle with a `main.rb` as the external trigger to kickstart the program. Testing was done as the coding progressed iteratively, testing each user input and checking method in turn. 

The key difficulty faced by the team was in clarifying each step of a single battle, what happens with each user input (move) versus computer feedback. 

Refactoring the code to keep it extensible and readable for future development was a challenging exercise. 

Healthy time management was also difficult in maintaining a balance between researching for gems, deciding upon MVP functionalities, deciding which functionalities to relegate as 'nice-to-have' for future exploration.

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/docs/timeline.png)

## Record of Planning Progress
* [User Input Flowchart](https://github.com/matthew-puku/monster-smash/blob/master/docs/UserInput_flowchart.JPG)
* [Early Objects and class](https://github.com/matthew-puku/monster-smash/blob/master/docs/Code_structure.JPG)
* [Early Battle flow chart](https://github.com/matthew-puku/monster-smash/blob/master/docs/BattleStructure.JPG)
* [Final Objects and Classes](https://github.com/matthew-puku/monster-smash/blob/master/docs/Objects_classes.png)
* [User flow chart](https://github.com/matthew-puku/monster-smash/blob/master/docs/flowchart.pdf)
* [Early timeline](https://github.com/matthew-puku/monster-smash/blob/master/docs/Timeline.JPG)

## Project Timeline 

Project workload was distributed using [Trello](https://trello.com/b/mWeDQSQo/monster-battle-ruby-app), tracked alongside a dissection of the client brief (assignment rubric).

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/docs/Trello1.png)

Planning, research and conceptualising the code structure was primarily achieved in one afternoon sitting by prototyping on paper. The coding was an iterative process spread across two afternoons between 5 March to 6 March.

## Testing

Rigorous user input testing was conducted to capture as many instances of edge cases as possible. A detailed listing of test cases can be reviewed [here](https://github.com/matthew-puku/monster-smash/blob/master/docs/Monster%20Smash%20Testing%20-%20Sheet1.pdf). 

Due to the time constraints of the project, user acceptance testing was not conducted. However, during the iterative development process, smaller unit testing was conducted with each new feature added. 

![alt_text](https://github.com/matthew-puku/monster-smash/blob/master/docs/method_test_example.png)

## Accessibility

The [Web Content Accessibility Guidelines 2.0](https://www.w3.org/WAI/standards-guidelines/wcag/) was consulted adjacent to the coding process. All functionality of the content on *Monster Smash* is operable through a keyboard interface without requiring specific timings for individual keystrokes. There is sufficient clarity in the visual design (black and white) with clear, simple English instructions prompting user input at every step. The only possible point of improvement could be to increase the text sizes for easier screen-reading. 

However, the development team acknowledges that until the product has been live-tested with the target demographic users (focus group testing), it is not immediately clear whether *Monster Smash* has adequately catered for all users from a spectrum of ableness based on the [WCAG 2.0](https://www.w3.org/WAI/WCAG21/quickref/?versions=2.0).

## Copyright, ethical, social issues

As a text-based application with comparatively primitive controls (alphabetical), the development team did not foresee the application would raise any questions of moral, social, ethical consequences. This is entirely a work of fiction, as a homage to other highly sucessful game franchises such as Pokemon and Dungeons & Dragons. There is no use of imagery or text that incites violence or an unpleasant response. The game is designed purely to entertain rather than to provoke a reaction or send a political message.

Copyright issues were, however, discussed in terms of selecting an appropriate game character theme that is already in the public domain. Generic halloween monsters was decided upon to circumvent copyright issues with using  popular culture franchises (e.g.Pokemon). The turn-based game mechanic is long-standing gaming tradition with no specific patent attached, to the knowledge of developers. 

## License

**Copyright (c) 2019 Matthew Puku, Rachel Wong** for [Coder Academy](https://coderacademy.edu.au).

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to [use, copy, modify, merge, publish, distribute](https://github.com/matthew-puku/monster-smash/blob/master/CONTRIBUTING.md) and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

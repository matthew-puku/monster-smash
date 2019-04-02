require_relative "move.rb"

class Monster
  # Class for representing fight-able characters in the game, including the player character.
  # Monsters store state for reference by the rest of the program (mostly battle.rb and the use
  # methods in move.rb)

  attr_reader :name, :moves, :default_dodge, :default_max_HP
  attr_accessor :max_HP, :current_HP, :dodge, :power
  
  def initialize(name, max_HP, dodge, moves, power = 100)
    @name = name             # A string, e.g. "Dracula"
    @moves = moves           # An array of Move objects.
    @current_HP = max_HP     # An integer, initialised to the same value as @max_HP. 
                             # When this hits 0, the monster is defeated.
    @max_HP = max_HP         # An integer. If a monster's HP is restored, it cannot go above this
                             # value.
    @dodge = dodge           # An integer. Determines the likelihood of being hit by attacks.
                             # Default is 50.
                             # Use 1000 when a monster should be unhittable by normal means
    @power = power           # An integer. Multiplies the damage of Attack moves.
                             # Use 100 to deal default damage, 150 to deal 50% extra, etc.
    @default_dodge = dodge   # The default value of dodge. If a move removes buffs/debuffs,
                             # dodge will be set to this stat.
    @default_max_HP = max_HP # As above, but for max_HP
    @default_power = power   # As above, but for power
  end

  # Returns a move from @moves based on the input string. First tries to find a full match. If that
  # fails, it will return a move that matches the first letter of the input string. If that fails,
  # returns nil.
  def search_moves(input)
    input = input.downcase
    found_move = nil # Last resort, returned if no matches found.
    @moves.each do |move|
      if input == move.name.downcase # Check for a full match
        found_move = move
        break # If a full match is found, stop looping. This will return it immediately.
      end

      if input[0] == move.name.downcase[0] # Check for a first-letter match
        found_move = move
      end
    end

    found_move
  end

  # Returns a random move from @moves
  def random_move
    @moves.sample
  end

  # Returns @moves as a nice string that prompts valid user input.
  # Intended to be cocenated with a string that allows the user to quit.
  def display_moves 
    output = "Choose a move: "
    
    # Puts parenthesis around the (f)irst (l)etter of each move and cocenates it to the output.
    @moves.each { |move| output << "(#{move.name[0]})#{move.name[1,99]}, " }

    output
  end
end

PLAYER = Monster.new("You", 150, 50, [SMASH, RAPID_ATTACK, BERSERK])
FRANK = Monster.new("Frankenstein's Monster", 150, 50, [SMASH, THRASH])
DRACULA = Monster.new("Dracula", 150, 60, [RAPID_ATTACK, LEECHING_BITE])

WOLFMAN = Monster.new("Wolfman", 150, 50, [SMASH, RAPID_ATTACK, THRASH, BASH])
IGOR = Monster.new("Igor", 100, 50, [SMASH, RAPID_ATTACK, THRASH, BASH])
ZOMBIE = Monster.new("Zombie", 120, 40, [SMASH, RAPID_ATTACK, THRASH, BASH])

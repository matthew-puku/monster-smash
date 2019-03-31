require_relative "move.rb"

class Monster
  attr_reader :name, :moves, :default_dodge, :default_max_HP
  attr_accessor :max_HP, :current_HP, :dodge, :power
  
  def initialize(name, max_HP, dodge, moves, power = 100)
    @name = name             # A string, e.g. "Dracula"
    @moves = moves           # An array of Move objects.
    @current_HP = max_HP     # An integer, initialised to the same value as @max_HP. When this hits 0, the monster is defeated.
    @max_HP = max_HP         # An integer. If a monster's HP is restored, it cannot go above this value.
    @dodge = dodge           # An integer. Determines the likelihood of being hit by attacks. 50 is default.
                             # Use 1000 when a monster should be unhittable by normal means
    @power = power           # An integer. Multiplies the damage of Attack moves. Use 100 to deal default damage, 150 to deal 50% extra, etc.
    @default_dodge = dodge   # The default value of dodge. If a move removes buffs/debuffs, dodge will be set to this stat.
    @default_max_HP = max_HP # As above, but for max_HP
    @default_power = power   # As above, but for power
  end

  def search_moves(input) # Returns a move from @moves based on the input string.
    input = input.downcase
    found_move = nil # Last resort, returned if no matches found.
    for move in @moves
      if input == move.name.downcase # Check for a full match
        found_move = move
        break # If a full match is found, stop looping. This will return it immediately.
      end

      if input[0] == move.name.downcase[0] # Check for a first-letter match
        found_move = move
      end
    end

    return found_move
  end

  def random_move # Returns a random move from @moves
    return @moves.sample
  end

  def display_moves # Formats @moves into a nice string that encourages correct user input and returns it. Intended to be cocenated with a string that allows the user to quit.
    output = "Choose a move: "
    for move in @moves do # Puts parenthesis around the (f)irst (l)etter of each move and cocenates it to the output.
      output += "(#{move.name[0]})#{move.name[1,99]}, "
    end

    return output
  end
end

Player = Monster.new("You", 150, 50, [Smash, Rapid_Attack, Berserk])
Frank = Monster.new("Frankenstein's Monster", 150, 50, [Smash, Thrash])
Dracula = Monster.new("Dracula", 150, 60, [Rapid_Attack, Leeching_Bite])

# Wolfman = Monster.new("Wolfman", 150, 50, [Smash, Rapid_Attack, Thrash, Bash]) 
# Igor = Monster.new("Igor", 100, 50, [Smash, Rapid_Attack, Thrash, Bash])
# Zombie = Monster.new("Zombie", 120, 40, [Smash, Rapid_Attack, Thrash, Bash])

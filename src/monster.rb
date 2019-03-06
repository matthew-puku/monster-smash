require_relative "move.rb"

class Monster
    attr_reader :name, :moves, :default_dodge, :default_max_HP
    attr_accessor :max_HP, :current_HP, :dodge
    
    def initialize(name, max_HP, dodge, moves)
        @name = name              # A string, e.g. "Dracula"
        @current_HP = max_HP      # An integer, initialised to the same value as @max_HP. When this hits 0, the monster is defeated.
        @max_HP = max_HP          # An integer. If a monster's HP is restored, it cannot go above this value.
        @dodge = dodge            # An integer. Determines the likelihood of being hit by attacks. 50 is default.
                                      # Use 1000 when a monster should be unhittable by normal means
        @default_dodge = dodge    # The default value of dodge. If a move removes buffs/debuffs, dodge will be set to this stat.
        @default_max_HP = max_HP  # As above, but for max_HP
        @moves = moves            # An array of Move objects.
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
        return @moves[rand(0...@moves.length)]
    end
    def display_moves # Formats @moves into a nice string that encourages correct user input and returns it. Intended to be cocenated with a string that allows the user to quit.
        output = "Choose a move: "
        for move in @moves do # Puts parenthesis around the (f)irst (l)etter of each move and cocenates it to the output.
            output += "(#{move.name[0]})#{move.name[1,99]}, "
        end
        return output
    end
end

Frank = Monster.new("Frankenstein's Monster", 150, 50, [Smash])


Jerry = Monster.new("Jerry Seinfeld", 120, 50, [Smash])
# Smash.use!(Frank, Jerry)
# Dracula = Monster.new("Dracula", 100, 100, [Smash, Rapid_Attack, Thrash, Bash])
# Wolfman = Monster.new("Wolfman", 150, 150, [Smash, Rapid_Attack, Thrash, Bash]) 
# Igor = Monster.new("Igor", 100, 100, [Smash, Rapid_Attack, Thrash, Bash])
# Zombie = Monster.new("Zombie", 120, 120, [Smash, Rapid_Attack, Thrash, Bash])

# puts frank.name
# puts frank.moves
# puts frank.max_HP
# puts frank.display_moves
# puts Frank.search_moves("Rapid Attack")
# puts Frank.search_moves("r")
# puts Frank.search_moves("egg salad")
# puts frank.search_moves("yessm")
# puts frank.search_moves("s")
# puts Frank.random_move.name
# puts Frank.random_move.name
# puts Frank.random_move.name
# puts Frank.random_move.name
# puts Frank.random_move.name
# puts Frank.random_move.name
# puts Frank.random_move.name
# puts Frank.random_move.name
# puts Frank.random_move.name
#beep

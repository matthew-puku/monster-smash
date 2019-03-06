require_relative "move.rb"

class Monster
    attr_reader :name, :moves
    attr_accessor :max_HP, :current_HP
    
    def initialize(name, max_HP, current_HP, moves)
        @name = name              # A string, e.g. "Dracula"
        @max_HP = max_HP          # An integer. When a monster takes this much damage, it is defeated.
        @current_HP = current_HP  # An integer, typically initialised to the same value as @max_HP.
        @moves = moves            # An array of Move objects. There should be four.
    end
    def search_moves(input) # Returns a move from @moves based on the input string.
        input = input.downcase
        found_move = nil # Last resort, returned if no matches found.
        for move in @moves
            puts "checking #{move.name}"
            if input == move.name.downcase # Check for a full match
                found_move = move
                puts "full match for #{move.name}"
                break # If a full match is found, stop looping. This will return it immediately.
            end
            if input[0] == move.name.downcase[0] # Check for a first-letter match
                found_move = move
                puts "partial match for #{move.name}"
            end
        end
        puts "loop complete"
        return found_move # Returns whatever
    end
    def random_move # Returns a random move from @moves
        return @moves[rand(1...@moves.length)]
    end
    def display_moves # Formats @moves into a nice string that encourages correct user input and returns it. Intended to be cocenated with a string that allows the user to quit.
        output = "Choose a move: "
        for move in @moves do # Puts parenthesis around the (f)irst (l)etter of each move and cocenates it to the output.
            output += "(#{move.name[0]})#{move.name[1,99]}, "
        end
        return output
    end
end

Frank = Monster.new("Frankenstein's Monster", 150, 150, [Smash, Rapid_Attack, Thrash, Bash])


Jerry = Monster.new("Jerry Seinfeld", 120, 120, [Smash, Rapid_Attack, Thrash, Bash])
Dracula = Monster.new("Dracula", 100, 100, [Smash, Rapid_Attack, Thrash, Bash])
Wolfman = Monster.new("Wolfman", 150, 150, [Smash, Rapid_Attack, Thrash, Bash]) 
Igor = Monster.new("Igor", 100, 100, [Smash, Rapid_Attack, Thrash, Bash])
Zombie = Monster.new("Zombie", 120, 120, [Smash, Rapid_Attack, Thrash, Bash])

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

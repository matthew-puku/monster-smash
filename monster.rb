require_relative "move.rb"

class Monster
    attr_reader :name, :moves
    attr_accessor :max_HP, :current_HP
    
    def initialize(name, max_HP, current_HP, moves)
        @name = name # A string, e.g. "Dracula"
        @max_HP = max_HP # An integer. When a monster takes this much damage, it is defeated.
        @current_HP = current_HP # An integer, typically initialised to the same avlue as @max_HP.
        @moves = moves # An array of Move objects. There should be four.
    end
    def search_moves(input) # Returns a move from @moves based on the input string.
        # Dev note: could be DRYer
        input = input.downcase
        found_move = nil # Last resort, returned if no matches found.
        for move in @moves # Searches for first-letter matches.
            if input[0] == move.name.downcase[0]
                found_move = move
            end
        end
        for move in @moves # Searches for whole-string matches. Overwrites single-letter match if found.
            if input == move.name.downcase
                found_move = move
            end
        end
        return found_move
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

Frank = Monster.new("Frankenstein's Monster", 150, 150, [Smash, Quick_Attack, Thrash, Bash])
Jerry = Monster.new("Jerry Seinfeld", 120, 120, [Smash, Quick_Attack, Thrash, Bash])

# puts frank.name
# puts frank.moves
# puts frank.max_HP
# puts frank.display_moves
# puts frank.search_moves("Quick_Attack")
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
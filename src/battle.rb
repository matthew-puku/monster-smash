require_relative "monster.rb"

class Battle
    attr_accessor :combatants
    attr_reader :outcome

    def initialize(combatants)
        @combatants = combatants        # An array of two Monster objects
        @outcome = :ongoing             # A symbol, used to inform main.rb of the gamestate.
                                            # Options are :ongoing, :quit, :combatant0win, :combatant1win, and :draw
        @player_0_speed_advantage = 0.5 # A float, used to determine which move goes first in the event of a tie.
                                            # DEV NOTE: this could be chosen by code structure alone, but doing it
                                            # in a variable makes it easier to change.
    end
    def update_outcome! # Checks combatants' HP and updates @outcome accordingly.
        if @combatants[0].current_HP <= 0 and @combatants[1].current_HP <= 0
            @outcome = :draw
        elsif @combatants[0].current_HP <= 0
            @outcome = :combatant1win
        elsif @combatants[1].current_HP <= 0
            @outcome = :combatant0win
        end
    end
    def display_choices(monster) # Returns a monster's formatted movelist plus the option to quit.
        output = monster.display_moves + "or type (Q)uit to give up."
        return output
    end
    # def display_healths
    #     puts "#{target.name} has #{target.current_HP.to_i}HP remaining."
    # end
    def run_round # Plays a turn of the game and updates the outcome as necessary. Best used in a while/until loop.
        # Move selection. DEV NOTE: this code could be replaced to create a 2 player game or a computer vs. computer auto-battle
        validating_input = true
        while validating_input # In this loop, the player can choose a move or quit
            puts display_choices(@combatants[0])
            user_input = gets.chomp.downcase
            search_result = combatants[0].search_moves(user_input) # Storing in a variable to avoid running the function twice (once for conditional and once to store a success)
            if search_result != nil # executes if valid combat input was entered
                combatant0move = search_result # DEV NOTE: Reassigning this variable is not strictly necessary, but makes code more readable and modular
                validating_input = false # exits while loop
            elsif user_input == "q" or user_input == "quit"
                @outcome = :quit # change bout outcome to inform main.rb of user desire to quit.
                return # break out of the function. DEV NOTE: there may be a nicer way to do this but time does not permit research.
            else
                puts "Invalid input! Please try again."
            end
        end
        combatant1move = @combatants[1].random_move # The computer chooses a move randomly

        # Once moves are selected, decide who will go first
        if combatant0move.speed + @player_0_speed_advantage > combatant1move.speed # Player first
            first_move = combatant0move
            first_mover = @combatants[0]
            second_move = combatant1move
            second_mover = @combatants[1]
        else                                                                       # Computer first
            first_move = combatant1move
            first_mover = @combatants[1]
            second_move = combatant0move
            second_mover = @combatants[0]
        end

        # Fight!
        first_move.use!(first_mover, second_mover)
        update_outcome! # Keep main.rb updated on battle state.
        if outcome == :ongoing # Check the move didn't end the battle before continuing
            second_move.use!(second_mover, first_mover)
        end
        update_outcome! # Keep main.rb updated on battle state.
    end
end



# puts Smash
# puts Frank
# puts bout.display_choices(bout.combatants[0])
# bout.execute_move(Frank.random_move, Frank, Jerry)
#beep
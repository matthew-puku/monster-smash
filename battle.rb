require_relative "monster.rb"

class Battle
    attr_accessor :combatants
    attr_reader :outcome

    def initialize(combatants)
        @combatants = combatants # An array of two Monster objects
        @outcome = :ongoing # A symbol, used to inform main.rb of the gamestate. Options are :ongoing, :quit, :combatant0win, :combatant1win, and :draw
        @player_0_speed_advantage = 0.5 # A float, used to determine which move goes first in the event of a tie. Dev note: this could be chosen by code structure alone, but doing it in a variable is easier to change.
    end

    # check HP for user and computer
    # if HP!= 0 continue play
    # if HP == 0 lead to victory/defeat screen
    def update_outcome!
        # no need to check for outcome here as this method is only called after a move is executed
        if @combatants[0].current_HP <= 0 and @combatants[1].current_HP <= 0
            @outcome = :draw
        elsif @combatants[0].current_HP <= 0
            @outcome = :combatant1win
        elsif @combatants[1].current_HP <= 0
            @outcome = :combatant0win
        end
    end

    # # print victory/defeat screen messages
    # # if user HP!=0 && computer HP = 0 --> VICTORY
    # # if user HP=0 && computer HP !=0 --> DEFEAT
    # def printScreen(status)
    # end

    def execute_move(move, attacker, target)
        # evaluates all effects of a move
        puts "#{attacker.name} used #{move.name}!"
        target.current_HP -= move.damage
        update_outcome!
        puts "#{target.name} has #{target.current_HP.to_i}HP remaining."
    end

    def display_choices(monster)
        output = monster.display_moves + "or type (Q)uit to give up."
        return output
    end

    def run_round
        puts display_choices(@combatants[0])
        combatant0move = @combatants[0].search_moves(gets) # must add validation and ability to quit here. if quit set outcome to :quit and break
        combatant1move = @combatants[1].random_move
        if combatant0move.speed + @player_0_speed_advantage > combatant1move.speed
            first_move = combatant0move
            first_mover = @combatants[0]
            second_move = combatant1move
            second_mover = @combatants[1]
        else
            first_move = combatant1move
            first_mover = @combatants[1]
            second_move = combatant0move
            second_mover = @combatants[0]
        end
        execute_move(first_move, first_mover, second_mover)
        update_outcome! # Check the move didn't end the battle before continuing
        if outcome == :ongoing 
            execute_move(second_move, second_mover, first_mover)
        end
        update_outcome!
    end

    # print a monster's four move options, plus the option to quit 

end

# puts Smash
# puts Frank
# puts bout.display_choices(bout.combatants[0])
# bout.execute_move(Frank.random_move, Frank, Jerry)
#beep
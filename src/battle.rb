require_relative "monster.rb"

class Battle
  # A Battle is the basic loop of the game. Two monsters fight until one or both of them have no
  # current_HP remaining, then battle will update @outcome for use by outer levels of game logic.
  # Other than @outcome, Battle is stateless. Game state is mostly stored by Monster objects.

  attr_accessor :combatants
  attr_reader :outcome

  def initialize(combatants)
    @combatants = combatants        # An array of two Monster objects
    @outcome = :ongoing             # A symbol, used to inform main.rb of the gamestate.
                                        # Options are :ongoing, :quit, :combatant0win (human win),
                                        # :combatant1win (computer win), and :draw
    @player_0_speed_advantage = 0.5 # A float, used to determine which move goes first if tied.
                                        # This could be chosen by code structure alone, but doing it
                                        # in a variable makes it easier to change.
  end
  
  # Checks combatants' HP and updates @outcome accordingly.
  def update_outcome! 
    if @combatants[0].current_HP <= 0 && @combatants[1].current_HP <= 0    # Draw
      @outcome = :draw
    elsif @combatants[0].current_HP <= 0                                   # Computer Win
      @outcome = :combatant1win
    elsif @combatants[1].current_HP <= 0                                   # Human Win
      @outcome = :combatant0win
    end
  end
  
  # Prints a nice message for the start of a battle.
  def display_commencement 
    slow_puts("The battle begins! #{@combatants[0].name} vs. #{@combatants[1].name}")
  end
  
  # Returns a monster's formatted movelist plus the option to quit.
  def display_choices(monster) 
    output = monster.display_moves + "or type (Q)uit to give up."
    return output
  end
  
  # Displays erstaz healthbars
  def display_healths 
    slow_puts("YOU: #{combatants[0].current_HP.to_i}HP\n"\
              "FOE: #{combatants[1].current_HP.to_i}HP",
              delay: 0.5,
              press_any_key: false)
  end
  
  # Makes user select a move for given Monster and returns it. If they choose to quit, updates
  # @outcome and returns false.
  def user_select_move(combatant) 
    validating_input = true
    selected_move = nil
    while validating_input
      # Display useful information to inform player choice before asking for input
      display_healths
      puts display_choices(combatant)
      
      # Get user input
      user_input = gets.chomp.downcase
      system "clear"
      search_result = combatant.search_moves(user_input)
      # This is stored in a variable to avoid running the function twice
      # (once for the conditional and once to return on success)
      
      # Check the input
      if search_result != nil    # Valid move input
        return search_result 
        validating_input = false
      elsif user_input[0] == "q" # Valid quit input
        @outcome = :quit # Change bout outcome to inform main.rb of user desire to quit.
        validating_input = false
      else                       # Invalid input
        slow_puts("Invalid input! Please try again.", delay: 0.5)
      end
    end
  end
  
  # Plays a turn of the game and updates the outcome as necessary. Best used in a while/until loop.
  def run_round( 
    combatant0move = user_select_move(combatants[0]), # By default, the user chooses a move by input
    combatant1move = @combatants[1].random_move)      # and the computer selects randomly
    
    # Check neither combatant chose to quit
    if @outcome == :quit 
      return # Stops executing this method
    end

    # Decide who will go first by comparing the speed of the moves
    # Human character has a tiny speed advantage to avoid a draw situation
    
    # Player first
    if combatant0move.speed + @player_0_speed_advantage > combatant1move.speed 
      first_move = combatant0move
      first_mover = @combatants[0]
      second_move = combatant1move
      second_mover = @combatants[1]
    # Computer first
    else                                                                       
      first_move = combatant1move
      first_mover = @combatants[1]
      second_move = combatant0move
      second_mover = @combatants[0]
    end

    # Fight! 
    first_move.use!(first_mover, second_mover)

    # Check the move didn't end the battle (exhaust HP) before continuing
    update_outcome!
    if outcome == :ongoing
      second_move.use!(second_mover, first_mover)
      update_outcome!
    end
  end
end

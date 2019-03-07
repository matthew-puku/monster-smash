require_relative "messages.rb"

# Creates a move 
class Move
    attr_reader :name, :speed, :accuracy
    def initialize(name, speed, accuracy)
        @name = name         # A string, e.g. "Smash"
        @speed = speed       # An integer. Determines which move is evaluated first in combat.
                                 # Speeds should range from 1 to 100 in most cases.
        @accuracy = accuracy # An integer. Helps determine if the move will succeed or not.
                                 # An accuracy of 50 will hit a dodge of 50 half the time.
                                 # Moves that don't involve the opponent check against a dodge of 50.
                                 # Use 10000 for guaranteed success.
    end
    def use!(user, opponent) # user and opponent must be two Monster objects.
        slow_puts("#{user.name} used #{@name}!")
    end
end

# Checking gateway for deciding whether attack (damage) to be applied to opponent on probability
class Attack < Move
    attr_reader :damage

    def initialize(name, speed, accuracy, damage)
        super(name, speed, accuracy)
        @damage = damage # An integer. The base damage of the attack.
    end
    
    # Accuracy vs Dodge check
    # Added a random number generator to the check to avoid draw situation
    # If player's accuracy count > opponent's dodge, apply damage to opponent's HP
    def use!(user, opponent)
        super(user, opponent)
        if @accuracy + rand(1..100) > opponent.dodge + 50 # Accuracy check vs. dodge
            slow_puts "It hit for #{damage} damage."
            opponent.current_HP -= @damage
            return :hit
            
        # If player's accuracy count < opponent's dodge, do not apply dmaage to HP
        else
            slow_puts "...but it missed."
            return :miss
        end 
    end
end

# Create different move objects
# DEV NOTE: it made more sense to us to put the move data in move.rb next to the classes referenced, for easier understanding.
# Additionally, parsing hashes into constructors is tedious.
Smash = Attack.new("Smash",
    30, # speed
    95, # accuracy
    50  # damage
)
Rapid_Attack = Attack.new("Rapid Attack",
    95, # speed
    95, # accuracy
    15  # damage
)
Thrash = Attack.new("Thrash",
    70, # speed
    70, # accuracy
    30  # damage
)
Bash = Attack.new("Bash",
    10, # speed
    95, # accuracy
    40  # damage
)

class LifestealAttack < Attack # Like an Attack, but steals some HP from the opponent
    def initialize(name, speed, accuracy, damage, lifesteal_factor)
        super(name, speed, accuracy, damage)
        @lifesteal_factor = lifesteal_factor # The amount of damage returned as health. 1 = 100%, 1.5 = 150%, etc.
    end
    def use!(user, opponent)
        move_outcome = super(user, opponent)
        if move_outcome == :hit
            healing = @damage * @lifesteal_factor
            user.current_HP += healing # heals user
            if user.current_HP > user.max_HP # checks user wasn't healed above their max
                user.current_HP = user.max_HP
            end
            slow_puts "#{user.name} healed #{healing.to_i}HP."
        end
    end
end

Leeching_Bite = LifestealAttack.new("Leeching Bite",
    10, # speed
    95, # accuracy
    25, # damage
    1   # lifesteal_factor
)

# Boost_Speed = Move.new("Boost Speed", 10, 90)
# Berserk = Move.new("Berserk", 50, 10)

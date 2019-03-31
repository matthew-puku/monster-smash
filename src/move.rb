require_relative "messages.rb"

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

class Rage < Move # Simple buff/debuff combo move. Relies on natural attribute reset at end of combat.
    attr_reader :name, :speed, :accuracy, :power_buff, :dodge_debuff
    
    def initialize(name, speed, accuracy, power_buff, dodge_debuff)
        super(name, speed, accuracy)
        @power_buff = power_buff     # An integer. The move increases the user's power by this amount.
        @dodge_debuff = dodge_debuff # An integer. The move decreases the user's dodge by this amount.
    end

    def use!(user, opponent)
        super(user, opponent) # This will puts the message specificied in the Move class
        user.power += power_buff
        user.dodge -= dodge_debuff
        slow_puts("#{user.name}'s power rose and dodge fell!")
    end
end

Berserk = Rage.new("Berserk",
    5,     # speed
    10000, # accuracy
    40,    # power_buff
    20,    # dodge_debuff
)


class Attack < Move
    attr_reader :damage
    
    def initialize(name, speed, accuracy, damage)
        super(name, speed, accuracy)
        @damage = damage # An integer. The base damage of the attack.
    end
    
    def use!(user, opponent)
        super(user, opponent) # This will puts the message specificied in the Move class

        # Checks the accuracy attribute against the opponent's dodge stat to decide whether the move takes effect.
        # Accuracy is added to a random number and dodge is added to 50 to allow for variation in outcomes
        # If combined accuracy > combined dodge, apply the damage to HP and return :hit for use by subclass methods
        if @accuracy + rand(1..100) > opponent.dodge + 50
            slow_puts "It hit for #{damage} damage."
            opponent.current_HP -= @damage
            return :hit
            
        # If accuracy < Dodge, do not apply the damage to HP and return :miss for use by subclass methods
        else
            slow_puts "...but it missed."
            return :miss
        end 
    end
end

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
    
    # if the move is a hit (not a miss), increase player's HP and decrease the opponent's HP 
    def use!(user, opponent)
        # Puts a message, returns the outcome of an accuracy check, and damages the opponent if applicable.
        move_outcome = super(user, opponent)

        # If the accuracy check passed, this code will execute.
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



Boost_Speed = Move.new("Boost Speed", 10, 90)

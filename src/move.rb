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
        puts "#{user.name} used #{@name}!"
    end
end

class Attack < Move
    attr_reader :damage

    def initialize(name, speed, accuracy, damage)
        super(name, speed, accuracy)
        @damage = damage # An integer. The base damage of the attack.
    end
    def use!(user, opponent)
        super(user, opponent)
        if @accuracy + rand(1..100) > opponent.dodge + 50 # Accuracy check vs. dodge
            puts "It hit for #{damage} damage."
            opponent.current_HP -= @damage
        else
            puts "...but it missed."
        end 
    end
end

# initialise new moves with respective damage counts and speed counts
Smash = Attack.new("Smash", 30, 95, 50)
# Rapid_Attack = Move.new("Rapid Attack", 15, 90)
# Thrash = Move.new("Thrash", 20, 70)
# Bash = Move.new("Bash", 35, 10)
# Boost_Speed = Move.new("Boost Speed", 10, 90)
# Berserk = Move.new("Berserk", 50, 10)
# Leeching_Bite = Move.new("Leeching Bite", 10, 10)

# puts Smash.name
# puts Smash.speed
# puts Smash.accuracy
# puts Smash.damage
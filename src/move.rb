class Move
    attr_reader :name, :damage, :speed
    def initialize(name, damage, speed)
        @name = name # A string, e.g. "Smash"
        @damage = damage # An integer. The base damage of the move.
        @speed = speed # An integer. Determines which move is evaluated first. Speeds should range from 1 to 100 in most cases.
    end
end

# initialise new moves with respective damage counts and speed counts
Smash = Move.new("Smash", 30, 50)
Rapid_Attack = Move.new("Rapid Attack", 15, 90)
Thrash = Move.new("Thrash", 20, 70)
Bash = Move.new("Bash", 35, 10)
Boost_Speed = Move.new("Boost Speed", 10, 90)
Berserk = Move.new("Berserk", 50, 10)
Leeching_Bite = Move.new("Leeching Bite", 10, 10)

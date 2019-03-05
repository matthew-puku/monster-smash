class Move
    attr_accessor :damage, :speed
    attr_reader :name
    def initialize(name, damage, speed)
        @name = name # A string, e.g. "Smash"
        @damage = damage # An integer. The base damage of the move.
        @speed = speed # An integer. Determines which move is evaluated first. Speeds should range from 1 to 100 in most cases.
    end
end

Smash = Move.new("Smash", 30, 50)
Quick_Attack = Move.new("Quick Attack", 15, 90)
Thrash = Move.new("Thrash", 20, 70)
Bash = Move.new("Bash", 35, 10)
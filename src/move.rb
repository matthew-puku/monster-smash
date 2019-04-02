# move.rb contains all classes and subclasses. It also stores move data. All move classes have an
# initialise method which does what you'd expect, and a use method that will reference the move
# data to alter the state of the given Monsters.

require_relative "messages.rb"

class Move
  # Base move class. Only effect is to put a message.

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

  def use(user, opponent) # user and opponent must be two Monster objects.
    slow_puts("#{user.name} used #{@name}!")
  end
end

class Rage < Move
  # Increases user's power and decreases their dodge.

  attr_reader :name, :speed, :accuracy, :power_buff, :dodge_debuff
  
  def initialize(name, speed, accuracy, power_buff, dodge_debuff)
    super(name, speed, accuracy)
    @power_buff = power_buff     # An integer. The move increases the user's power by this amount.
    @dodge_debuff = dodge_debuff # An integer. The move decreases the user's dodge by this amount.
  end

  def use(user, opponent)
    super(user, opponent) # This will puts the message specificied in the Move class.
    
    user.power += power_buff
    user.dodge -= dodge_debuff
    
    slow_puts("#{user.name}'s power rose and dodge fell!")
  end
end

Berserk = Rage.new("Berserk",
  25,    # speed
  10000, # accuracy
  30,    # power_buff
  15,    # dodge_debuff
)

class Attack < Move
  # The simplest attack. Checks move accuracy against opponent's dodge and deals damage on hit.

  attr_reader :damage
  
  def initialize(name, speed, accuracy, damage)
    super(name, speed, accuracy)
    @damage = damage # An integer. The base damage of the attack.
  end
  
  def use(user, opponent)
    super(user, opponent) # This will puts the message specificied in the Move class

    # Checks the move's accuracy against the opponent's dodge to decide whether the move hits.
    # A random number is added to accuracy to allow for variation in outcomes.
    # 50 is added to dodge so that a move with 50 accuracy will hit 50 dodge 50% of the time.
    # If combined accuracy > combined dodge, apply the damage and return :hit for use in subclasses
    if @accuracy + rand(1..100) > opponent.dodge + 50
      adjusted_damage = @damage * (user.power / 100.0)
      opponent.current_HP -= adjusted_damage

      slow_puts "It hit for #{adjusted_damage.to_i} damage."
      :hit            
    # If accuracy < dodge, just return :miss for use in subclasses
    else
      slow_puts "...but it missed."
      :miss
    end
  end
end

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

class LifestealAttack < Attack
  # Like an Attack, but heals some HP on hit

  def initialize(name, speed, accuracy, damage, lifesteal_factor)
    super(name, speed, accuracy, damage)
    @lifesteal_factor = lifesteal_factor # The amount of damage returned as health. 1.15 = 115%.
  end
  
  # if the move hits, increase player's HP and decrease the opponent's HP 
  def use(user, opponent)
    # Puts a message, returns the outcome of an accuracy check, and damages the opponent if hit.
    move_outcome = super(user, opponent)

    # If the accuracy check passed, this code will execute.
    if move_outcome == :hit
      adjusted_damage = @damage * (user.power / 100.0)

      healing = adjusted_damage * @lifesteal_factor
      user.current_HP += healing

      # Stop user from being healed above their max
      if user.current_HP > user.max_HP 
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

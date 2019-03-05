require_relative "battle.rb"

# Welcome message, always executes.
puts "Welcome to Monster Smash!"

# Game loop, mostly (entirely?) methods of battle object
bout = Battle.new([Frank, Jerry])
until bout.outcome != :ongoing
    bout.run_round
end

# Victory screen, conditionally executes

# Defeat screen, conditionally executes

# Quit screen, always executes
puts "Thanks for playing!"
#beep
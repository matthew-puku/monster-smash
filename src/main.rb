require_relative "battle.rb"
require_relative "messages.rb"

welcome_screen # defined in messages.rb

# Game loop, mostly (entirely?) methods of battle object
bout = Battle.new([Player, Dracula])
bout.display_commencement
until bout.outcome != :ongoing
    bout.run_round
end

# Ending screens
if bout.outcome == :combatant1win    # Computer victory (player defeat)
    defeat_screen                       # defined in messages.rb
elsif bout.outcome == :combatant0win # Player victory
    victory_screen                      # defined in messages.rb
elsif bout.outcome == :draw          # Draw. Not possible with current moveset This will probably just trigger a loss in final version.
    puts "It's a draw!"                 # placeholder. 
end

quit_screen # defined in messages.rb
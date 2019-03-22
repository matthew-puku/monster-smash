require_relative "battle.rb"
require_relative "messages.rb"

# Main.rb triggers the start of a battle outputing screens from messages.rb and initialising a new battle object from battle.rb

welcome_screen # call welcome screen from messages.rb

# Commence gaming loop handled in battle.rb with two combatants, user and computer
bout = Battle.new([Player, Dracula])
bout.display_commencement

# Continue to run the battle until HP is exhausted
until bout.outcome != :ongoing
    bout.run_round
end

# Display screens depending on outcomes (defeat, victory, draw)
if bout.outcome == :combatant1win    # Computer victory (player defeat)
    defeat_screen                       # defined in messages.rb
elsif bout.outcome == :combatant0win # Player victory
    victory_screen                      # defined in messages.rb
elsif bout.outcome == :draw          # Draw. Not possible with current moveset This will probably just trigger a loss in final version.
    puts "It's a draw!"                 # placeholder. 
end

# Where HP is exhausted or Quit is triggered, game over screen
quit_screen # defined in messages.rb

system "clear"
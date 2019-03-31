require_relative "battle.rb"
require_relative "messages.rb"

# Main.rb contains big-picture game logic. More involved methods are called from other files.

welcome_screen # Call welcome screen from messages.rb

# Commence gaming loop handled in battle.rb with two combatants, user and computer
bout = Battle.new([Player, Dracula])
bout.display_commencement

# Continue to run the battle until HP is exhausted
until bout.outcome != :ongoing
  bout.run_round
end

# Display screens depending on outcomes (defeat, victory, draw)
if bout.outcome == :combatant1win    # Computer victory (player defeat)
  defeat_screen                       # Defined in messages.rb
elsif bout.outcome == :combatant0win # Player victory
  victory_screen                      # Defined in messages.rb
elsif bout.outcome == :draw          # Draw. Not possible with current moveset.
  defeat_screen                       # Defined in messages.rb
end

# Display goodbye screen, no matter the battle's outcome.
quit_screen # defined in messages.rb

system "clear"

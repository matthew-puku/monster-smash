require_relative "battle.rb"
require_relative "messages.rb"

welcome_screen # defined in messages.rb

command = gets.chomp.downcase

case command
when "c"
    # Game loop, mostly (entirely?) methods of battle object
    bout = Battle.new([Frank, Jerry])
    until bout.outcome != :ongoing
        bout.run_round
    end

    if bout.outcome == :combatant1win # computer victory (player defeat)
        defeat_screen # defined in messages.rb
    elsif bout.outcome == :combatant0win # player victory
        victory_screen # defined in messages.rb
    elsif bout.outcome == :draw
        puts "It's a draw!" # placeholder. This will probably just trigger a loss in final version.
    end

end

quit_screen # defined in messages.rb
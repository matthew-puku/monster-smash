require_relative "battle.rb"

# Welcome message, always executes.
puts " ---------------------------- "
puts "Welcome to Monster Smash!"
puts " ---------------------------- "
puts "Do you want to (C)ontinue or (Q)uit?"
puts " ---------------------------- "

command = gets.chomp.downcase

case command
    when "c"
        # Game loop, mostly (entirely?) methods of battle object
        bout = Battle.new([Frank, Jerry])
        until bout.outcome != :ongoing
            bout.run_round
        end

    # Defeat screen, conditionally executes
    if bout.outcome == :combatant1win
        puts " ---------------------------- "
        puts "   You have been defeated."
        puts " ---------------------------- "
        # Victory screen, conditionally executes
    elsif bout.outcome == :combatant0win
        puts " ---------------------------- "
        puts "   Congrats! You have won!"
        puts " ---------------------------- "
    # Quit screen, always executes
    else
        puts " ---------------------------- "
        puts "      Thanks for playing!"
        puts " ---------------------------- "
    end
    
    when "q"
        puts " ---------------------------- "
        puts "          Goodbye!"
        puts " ---------------------------- "
            
end

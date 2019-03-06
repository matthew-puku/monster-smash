require_relative "../battle.rb"

test_moves = [Smash, Rapid_Attack, Thrash, Bash, Leeching_Bite]

def slow_puts(string, delay = 1, press_any_key = true) # overwrite slow_puts method to make it instant
    puts string
end

for move in test_moves do
    puts "-=Testing #{move.name}=-"
    # Initialise two combatants and a battle
    alice = Monster.new("Alice", 10000, 50, test_moves)
    bob = Monster.new("Bob", 10000, 50, test_moves)
    test_bout = Battle.new([alice, bob])
    # Store move for deeper iteration
    first_move = move
    for second_move in test_moves do
        puts "-=Vs. #{second_move.name}=-"
        test_bout.run_round(first_move, second_move)
        test_bout.display_healths
    end
end
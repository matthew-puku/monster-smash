require_relative "../battle.rb"

def slow_puts(string, delay = 1, press_any_key = true) # Overwrite slow_puts method to make it instant and not require input.
                                                       # Comment these lines out if you'd like to step through round-by-round.
  puts string
end

test_moves = [Smash, Rapid_Attack, Thrash, Bash, Leeching_Bite] # All moves in this array will be tested against each other.

for first_move in test_moves do # Tests every move against every other move.
  puts "-=Testing #{first_move.name}=-"
  # Initialise two combatants and a battle
  alice = Monster.new("Alice", 10000, 50, test_moves)
  bob = Monster.new("Bob", 10000, 50, test_moves)
  test_bout = Battle.new([alice, bob])

  # Run tests
  for second_move in test_moves do
    puts "-=Vs. #{second_move.name}=-"
    test_bout.run_round(first_move, second_move)
    test_bout.display_healths
  end
end
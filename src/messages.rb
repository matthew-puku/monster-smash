# Messages.rb handles splash screens (welcome, victory, defeat, quit)
# and other text-related artistry.

require 'bundler/setup'
require 'rubygems'
require 'artii'
require 'io/console'

# Prints given string to the screen gradually.
# delay controls printout speed.
# if press_any_key is true, the user will need to press a button to continue once the string has
# finished displaying.
def slow_puts(string, delay: 1, press_any_key: true)                                           
  for i in (0..string.length) # Iterates over each index in a given string
    # Clear the screen to provide an animated effect.
    system "clear"

    # Puts all characters in the string up to the index being iterated over.
    puts string[0, i]
    sleep delay * 0.01
  end
  
  if press_any_key
    STDIN.getch
  end
end

# DEV NOTE: the following methods could be made DRYer, but it would be at the expense of artistry.
# Some hardcoding is unfortunately necessary.

# Displays the welcome splash screen
def welcome_screen
  system "clear"
  a = Artii::Base.new
  # puts
  puts "------------------------------   WELCOME TO   -------------------------------"
  puts
  puts a.asciify("Monster Smash!")
  puts "------------------------ PRESS ANY KEY TO CONTINUE --------------------------"
  STDIN.getch
  print "            \r" # extra space to overwrite in case next sentence is short
end

# Displays the victory splash screen
def victory_screen
  system "clear"
  b = Artii::Base.new
  # puts
  puts "------------------------------   VICTORY   -------------------------------"
  puts
  puts b.asciify("           YOU WON !")
  puts "------------------------ PRESS ANY KEY TO CONTINUE --------------------------"
  STDIN.getch
  print "            \r" # extra space to overwrite in case next sentence is short
end

# Displays the defeat splash screen
def defeat_screen
  system "clear"
  c = Artii::Base.new
  # puts
  puts "-------------------------------   DEFEATED   --------------------------------"
  puts
  puts c.asciify("         YOU LOST !")
  puts "------------------------ PRESS ANY KEY TO CONTINUE --------------------------"
  STDIN.getch
  print "            \r" # extra space to overwrite in case next sentence is short
end

# Displays the quit splash screen
def quit_screen
  system "clear"
  d = Artii::Base.new
  # puts
  puts "---------------------------   HASTALA VISTA   ---------------------------"
  puts
  puts d.asciify("  GAME OVER !")
  puts "------------------------ PRESS ANY KEY TO QUIT --------------------------"
  STDIN.getch
  print "            \r" # extra space to overwrite in case next sentence is short
end

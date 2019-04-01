# Messages.rb handles splash screens (welcome, victory, defeat, quit)
# and other text-related artistry.

require 'bundler/setup'
require 'rubygems'
require 'artii'
require 'io/console'

def slow_puts(string, # Puts given string to the screen gradually.
              delay = 1, # controls printout speed
              press_any_key = true) # if true, the user will need to press a button to continue
                                    # once the string has finished displaying
                                                       
  for i in (0..string.length) # Iterates over each character in given string individually
    system "clear"
    puts string[0, i] # Puts all characters up to and including the one being iterated over
    sleep delay * 0.01
  end
  
  if press_any_key
    STDIN.getch
  end
end

# DEV NOTE: the following methods could be made DRYer, but it would be at the expense of artistry.
# Some hardcoding is unfortunately necessary.

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

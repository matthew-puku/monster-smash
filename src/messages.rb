require 'bundler/setup'
require 'rubygems'
require 'artii'
require 'io/console'

def slow_puts(message, delay) # this might be gemmable
    # for character in message string:
        # clear screen
        # puts that character and all previous characters
        # wait for (delay * some sensible constant)
    # end
    # wait even longer
end

def welcome_screen
    a = Artii::Base.new
    puts
    puts "------------------------------   WELCOME TO   -------------------------------"
    puts
    puts a.asciify("Monster Smash!")
    puts "------------------------ PRESS ANY KEY TO CONTINUE --------------------------"
    STDIN.getch                                                                                                              
    print "            \r" # extra space to overwrite in case next sentence is short
end

def victory_screen
    b = Artii::Base.new
    puts
    puts "------------------------------   VICTORY   -------------------------------"
    puts
    puts b.asciify("           YOU WON !")
    puts "------------------------ PRESS ANY KEY TO CONTINUE --------------------------"
    STDIN.getch                                                                                                              
    print "            \r" # extra space to overwrite in case next sentence is short
end

def defeat_screen
    c = Artii::Base.new
    puts
    puts "-------------------------------   DEFEATED   --------------------------------"
    puts
    puts c.asciify("         YOU LOST !")
    puts "------------------------ PRESS ANY KEY TO CONTINUE --------------------------"
    STDIN.getch                                                                                                              
    print "            \r" # extra space to overwrite in case next sentence is short
end

def quit_screen
    d = Artii::Base.new
    puts
    puts "---------------------------   HASTALA VISTA   ---------------------------"
    puts
    puts d.asciify("  GAME OVER !")
    puts "------------------------ PRESS ANY KEY TO QUIT --------------------------"
    STDIN.getch                                                                                                              
    print "            \r" # extra space to overwrite in case next sentence is short
end
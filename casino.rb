require "pry"
require "colorize"

$budget = nil

class Wallet
attr_accessor :budget
def initialize

end

def start(budget)
  $budget = budget
  return $budget
end
def depo(amount)
  $budget = $budget + amount
  
end
def withdraw(amount)
  $budget = $budget - amount

end
end
$wallet = Wallet.new
$wallet.start(500)

class Casino
def initialize
  @games = ["Slots", "Black Jack", "Ride the Bus", "War"]
  print "
  .-.   .-.      .-.                               .-----.    
  : :.-.: :      : :                               `-. .-'    
  : :: :: : .--. : :   .--.  .--. ,-.,-.,-. .--.     : : .--. 
  : `' `' ;' '_.': :_ '  ..'' .; :: ,. ,. :' '_.'    : :' .; :
   `.,`.,' `.__.'`.__;`.__.'`.__.':_;:_;:_;`.__.'    :_;`.__.'
                                                              
                                                              
   .--.                          .---.    .--.               _             
  : .--'                         `--. :  : .--'             :_;            
  : : _ .--.  .--. .-..-..---.     ,','  : :    .--.   .--. .-.,-.,-. .--. 
  : :; :: ..'' .; :: :; :: .; `  .'.'_   : :__ ' .; ; `._-.': :: ,. :' .; :
  `.__.':_;  `.__.'`.__.': ._.'  :____;  `.__.'`.__,_;`.__.':_;:_;:_;`.__.'
                         : :                                               "
                         puts
  sleep 1
menu
end

def menu
  print "What would you like to play? "
  puts "($#{$budget})".green
  @games.each_with_index do |game,index|
    puts "#{index + 1}) #{game}"
    end
    print "> "
  case gets.strip.downcase
    when "1"
      if $budget > 0
      load "./slots.rb"
      menu
    else 
      puts
      puts "You need money to make money!"
      menu
    end
    when "2"
      if $budget > 0
      load "./black_jack.rb"
      menu
    else 
      puts
      puts "You need money to make money!"
      menu
    end
    when "3"
      if $budget > 0
      load "./high_or_low.rb"
      menu
    else 
      puts
      puts "You need money to make money!"
      menu
    end
  when "4"
    if $budget > 0
    load "./war.rb"
    menu
  else 
    puts
    puts "You need money to make money!"
    menu
  end
    when "quit"
      puts "Thank you for coming to Group 2 Casino"
      sleep 3
      print `clear`
      exit
    else
      puts "Please choose a game!"
      sleep 1
      menu
end
end
end
Casino.new
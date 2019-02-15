require "pry"

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
  @games = ["Slots", "Black Jack", "Ride the Bus"]
  puts "Welcome to Group 2 Casino"
  sleep 1
menu
end

def menu
  puts "What would you like to play?"
  @games.each_with_index do |game,index|
    puts "#{index + 1}) #{game}"
    end
    print "> "
  case gets.strip.downcase
    when "1"
      # require_relative "slots"
      menu
    when "2"
      # require_relative "black_jack"
      menu
    when "3"
      # require_relative "high_or_low"
      menu
    when quit
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
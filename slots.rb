
require "colorize"
class Slots
  def initialize
    puts "Welcome to Slots".cyan
    puts "Make your choice:".green
    puts "1) Play 3 Column Slots".light_blue
    puts "2) Play 5 Column Slots".light_blue
    puts "3) Back to Game Menu".light_blue
    input = gets.to_i
    case input
    when 1 
      play_slots_3
    when 2
      play_slots_5
    when 3
      "Bye!"
    else
      puts "Please type a number between 1 and 3."
      initialize
    end
  end

  def analyze_results_3
    if @picture_a == @picture_b && @picture_a == @picture_c
      puts "Congratulations! You win $100!!"
      $wallet.depo(100)
      puts "You now have $#{$wallet}"
      
    else 
      puts "Nice try! But you didn't win any money! Want to try again? (yes/no)"
      input = gets.strip
      case input
      when "yes"
        play_slots_3
      when "no"
        puts "Better luck in your next game!"
      else "Please type yes or no.".yellow
        analyze_results_3
      end
    end
  end
    
  def analyze_results_5
    if @picture_a == @picture_b && @picture_a == @picture_c && @picture_a == @picture_d && @picture_a == @picture_e
      puts "****Congratulations! You win $300!****"
      $wallet.depo(300)
      puts "You now have $#{$wallet}!"
      sleep(3)
    else puts "Nice try! But you didn't win any money! Want to try again? (yes/no)"
      input = gets.strip
      case input
      when "yes"
        play_slots_5
      when "no"
       puts "Better luck in your next game!"
      else 
        puts "Please type yes or no!".yellow
        analyze_results_5
      end
    end
  end


  def play_slots_3
    column_1 = ["cherry", "orange", "lemon", "watermelon", "grapes",]
    column_2 = ["cherry", "orange", "lemon", "watermelon", "grapes",]
    column_3 = ["cherry", "orange", "lemon", "watermelon", "grapes",]

    puts "Welcome to Slots.  Type 'spin' to play. Type 'quit' to go back to main menu."
    input = gets.downcase.strip
  case input
  when "spin"
    @picture_a = column_1.sample 
    @picture_b = column_2.sample 
    @picture_c = column_3.sample 
    print "      #{@picture_a}        "
    print "#{@picture_b}"
    puts "        #{@picture_c}"
    $wallet.withdraw(1)
    analyze_results_3

  when "quit"
   puts "Bye!"
  else
    puts "Please type spin or quit".yellow
    play_slots_3
end
end



def play_slots_5
  group_1 = ["wolf", "lion", "giraffe", "ferret", "mongoose", "hippo", "moose"]
  group_2 = ["wolf", "lion", "giraffe", "ferret", "mongoose", "hippo", "moose"]
  group_3 = ["wolf", "lion", "giraffe", "ferret", "mongoose", "hippo", "moose"]
  group_4 = ["wolf", "lion", "giraffe", "ferret", "mongoose", "hippo", "moose"]
  group_5 = ["wolf", "lion", "giraffe", "ferret", "mongoose", "hippo", "moose"]

  @picture_a = group_1.sample
  @picture_b = group_2.sample
  @picture_c = group_3.sample
  @picture_d = group_4.sample
  @picture_e = group_5.sample

  puts "Welcome to Slots.  Type 'spin' to play. Type 'quit' to go back to main menu."
    input = gets.downcase.strip
  case input
  when "spin"
    print "      #{@picture_a}        "
    print "#{@picture_b}"
    print "        #{@picture_c}"
    print "        #{@picture_d}"
    puts "         #{@picture_e}"
    $wallet.withdraw(1)
    analyze_results_5
  when "quit"
    puts "Bye!"
  else 
    puts "Please type 'spin' or 'quit'."
    play_slots_5
  end
end
end

game = Slots.new
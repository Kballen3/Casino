
require "colorize"
class Slots
  def initialize
    print `clear`
    puts "Welcome to Slots".cyan
    puts "Make your choice:".green
    puts "1) Play 3 Column Slots".light_blue
    puts "2) Play 5 Column Slots".light_blue
    puts "3) Back to Game Menu".light_blue
    input = gets.to_i
    case input
    when 1 
      welcome_slots_3
    when 2
      welcome_slots_5
    when 3
      puts "Bye!"
      print `clear`
    else
      puts "Please type a number between 1 and 3."
      initialize
    end
  end

  def analyze_results_3
    if @picture_a == @picture_b && @picture_a == @picture_c
      puts "Congratulations! You win $100!!".yellow
      $wallet.depo(100)
      
    else 
      puts "Nice try! But you didn't win any money! Want to try again? (yes/no)"
      input = gets.strip.downcase
      if input == "yes" && $budget > 0
        print `clear`
        play_slots_3
      elsif input == "yes" && $budget == 0
        puts 
        puts "Um, looks like you're out of money".green
      elsif "no"
        puts "Better luck in your next game!"
      else 
        puts "Please type yes or no.".yellow
        analyze_results_3
      end
    end
  end
    
  def analyze_results_5
    if @picture_a == @picture_b && @picture_a == @picture_c && @picture_a == @picture_d && @picture_a == @picture_e
      puts "****Congratulations! You win $300!****".yellow
      $wallet.depo(300)
      sleep(3)
    else puts "Nice try! But you didn't win any money! Want to try again? (yes/no)"
      input = gets.strip.downcase
        if input == "yes" && $budget > 0
          print `clear`
          play_slots_5
        elsif input == "yes" && $budget == 0
          puts 
          puts "Um, looks like you're out of money".green
        elsif "no"
          puts "Better luck in your next game!"
        else 
          puts "Please type yes or no.".yellow
        analyze_results_5
      end
    end
  end
def welcome_slots_3
    puts "Welcome to Slots.  Type 'spin' to play. Type 'quit' to go back to main menu."
    input = gets.downcase.strip
  case input
  when "spin"
    play_slots_3
  when "quit"
   puts "Bye!"
  else
    puts "Please type spin or quit".yellow
    play_slots_3
end
end
  def play_slots_3
    print `clear`
    column_1 = ["🍒", "🍊", "🍋", "🍉", "🍇",]
    column_2 = ["🍒", "🍊", "🍋", "🍉", "🍇",]
    column_3 = ["🍒", "🍊", "🍋", "🍉", "🍇",]
    @picture_a = column_1.sample 
    @picture_b = column_2.sample 
    @picture_c = column_3.sample 
     puts "       ____________".red
     puts "      |   SLOTS    |      __".red
     puts "     _| __________ |_    (__)".red     
    print "    |  *|#{@picture_a} |#{@picture_b} |#{@picture_c} |*  |   / /\n".red
    puts "    |   ----------   |  / /".red
    puts "    |   __________   |_/ /".red
    puts "    |__|__________|__|__/".red

    $wallet.withdraw(5)
    analyze_results_3
end
def welcome_slots_5
  puts "Welcome to Slots.  Type 'spin' to play. Type 'quit' to go back to main menu."
  input = gets.downcase.strip
case input
when "spin"
  play_slots_5
when "quit"
  puts "Bye!"
else 
  puts "Please type 'spin' or 'quit'."
  play_slots_5
end
end


def play_slots_5
  group_1 = ["🐺", "🦁", "🦒", "🦈", "🐵", "🦏", "🐊"]
  group_2 = ["🐺", "🦁", "🦒", "🦈", "🐵", "🦏", "🐊"]
  group_3 = ["🐺", "🦁", "🦒", "🦈", "🐵", "🦏", "🐊"]
  group_4 = ["🐺", "🦁", "🦒", "🦈", "🐵", "🦏", "🐊"]
  group_5 = ["🐺", "🦁", "🦒", "🦈", "🐵", "🦏", "🐊"]

  @picture_a = group_1.sample
  @picture_b = group_2.sample
  @picture_c = group_3.sample
  @picture_d = group_4.sample
  @picture_e = group_5.sample
    puts "       ____________".red
    puts "      |   SLOTS    |      __".red
    puts "     _| __________ |_    (__)"     .red
   print "    ||#{@picture_a} |#{@picture_b} |#{@picture_c} |#{@picture_d} |#{@picture_e} ||   / /\n".red
   puts "    | -------------- |  / /".red
   puts "    |   __________   |_/ /".red
   puts "    |__|__________|__|__/".red
   $wallet.withdraw(5)
  analyze_results_5
end
end

game = Slots.new
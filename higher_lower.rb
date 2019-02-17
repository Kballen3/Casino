require "pry"
require "colorize"

class Card
    attr_accessor :rank, :suit, :color

    def initialize(rank, suit, color)
        @rank = rank.to_i
        @suit = suit
        @color = color
    end
end

class Deck
    attr_accessor :cards

    def initialize
        @ranks = %w(1 2 3 4 5 6 7 8 9 10 11 12 13)
        @suits = %w(Spades Diamonds Clubs Hearts)
        @cards = []
        generate_deck
        shuffle_cards
    end

    def shuffle_cards
        @cards.shuffle
    end

    def generate_deck
        @suits.each do |suit|
            @ranks.size.times do |i|
                color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red'
                @cards << Card.new(@ranks[i], suit, color)
            end
        end
    end

    def display_cards
        @cards.shuffle.each do |card|
            puts "#{card.rank} #{card.suit} (#{card.color})"
        end
    end
end

class Game
    attr_accessor :cards

    def initialize
        print `clear`
        @d = Deck.new
        puts "Cost: $5".green
        puts "Potential winnings: $200".green
        sleep(2)
        print `clear`
        puts "Prepare to ride the bus...🚌".yellow
        sleep(2)
        guess_color
    end
    
    def ride_again
        puts "Ride again?".yellow
        puts "1) Yes!".green
        puts "2) No!".red
        reride = gets.to_i
        case reride
        when 1
            if $budget > 5
                print `clear`
                guess_color
            else 
                puts "Looks like you're out of money!"
            end
        when 2
            print `clear`
            # load "casino.rb"
        else
            puts "Invalid Choice".red
            ride_again
        end
    end
    
    def guess_color
        $wallet.withdraw(5)
        puts "Red or Black?".cyan
        guess = gets.to_s.strip.capitalize
        @card = @d.cards.sample
        color = @card.color
        if guess == color
            puts "Correct!".green
            sleep(1)
            print `clear`
            high_low
        else
            puts "Incorrect :(".red
            ride_again
        end
    end

    def high_low
        puts "#{@card.rank} higher or lower?".cyan
        @card_2 = @d.cards.sample
        @num = @card_2.rank
        guess = gets.to_s.strip.capitalize
        case guess
        when "Higher"
            if @num > @card.rank == true
                puts "Correct!".green
                sleep(1)
                print `clear`
                middle_out
            elsif @num == @card.rank
                puts "Same rank! New card is being drawn...".light_blue
                high_low
            else
                puts "Incorrect :(".red
                ride_again
            end
        when "Lower"
            if @num < @card.rank == true
                puts "Correct!".green
                sleep(1)
                print `clear`
                middle_out
            elsif @num == @card.rank
                puts "Same rank! New card is being drawn...".light_blue
                high_low
            else
                puts "Incorrect :(".red
                ride_again
            end
        else
            puts "Invalid choice, please try again".light_red
            high_low
        end
    end

    def middle_out
        if @num < @card.rank
            puts "#{@num} #{@card.rank} middle or outside?".cyan
        else @card.rank < @num
            puts "#{@card.rank} #{@num} middle or outside?".cyan
        end
        @card_3 = @d.cards.sample
        @rank_2 = @card_3.rank
        guess = gets.to_s.strip.capitalize
        case guess
        when "Outside"
            if @num < @card.rank
                outside = @rank_2.between?(@num, @rank_2)
                if outside == true
                    puts "Incorrect :(".red
                    ride_again
                else
                    puts "Correct!".green
                    sleep(1)
                    print `clear`
                    guess_suit
                end
            elsif @card.rank < @num
                out = @rank_2.between?(@rank_2, @num)
                if out == true
                    puts "Incorrect :(".red
                    ride_again
                else
                    puts "Correct!".green
                    sleep(1)
                    print `clear`
                    guess_suit
                end
            else
                puts "Same number! Move on...".blue
                guess_suit
            end
        when "Middle"
            if @num < @card.rank
                middle = @rank_2.between?(@num, @card.rank)
                if middle == true
                    puts "Correct!".green
                    sleep(1)
                    print `clear`
                    guess_suit
                else
                    puts "Incorrect :(".red
                    ride_again
                end
            elsif @card.rank < @num
                mid = @rank_2.between?(@card.rank, @num)
                if mid == true
                    puts "Correct!".green
                    sleep(1)
                    print `clear`
                    guess_suit
                else
                    puts "Incorrect :(".red
                    ride_again
                end
            else
                puts "Same number! Move on...".blue
                guess_suit
            end
        else
            puts "Invalid Choice, please try again".light_red
            middle_out
        end
    end
    
    def guess_suit
        puts "Hearts, Clubs, Diamonds, or Spades?".cyan
        @final_card = @d.cards.sample
        @final_guess = @final_card.suit
        guess = gets.to_s.strip.capitalize
        if guess == @final_guess
            puts "Correct! You win $20!".yellow
            $wallet.depo(200)
            ride_again
        else
            puts "Incorrect :(".red
            ride_again
        end
    end
end

Game.new
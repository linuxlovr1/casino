require_relative 'player'
require_relative 'deck'
class Slots
  attr_accessor
  
    def initialize(player)
      @player = player
      @deck = Deck.new
      @wheel_1 = @deck.suits
      @wheel_2 = @deck.suits
      @wheel_3 = @deck.suits
      puts "Welcome to the slot machine! Have a pull!"
      bet
    end

 def bet
   puts "You have $#{@player.amount}"
   puts "Each pull is $2.00\nHow much do you want to deposit?"
   deposit = gets.strip.to_i
   @player.amount -= deposit
   puts "#{@player.amount} remaining"
   pull_the_lever
end

def pull_the_lever
  puts "Press enter to pull the lever"
  gets
  spin_wheels
end

def spin_wheels
  puts "The wheels are spinning...."
   @first_wheel = @wheel_1.sample
   @second_wheel = @wheel_2.sample
   @third_wheel = @wheel_3.sample
   puts "#{@first_wheel} #{@second_wheel} #{@third_wheel}"
   did_you_win
end

def did_you_win
  if @first_wheel == @second_wheel && @second_wheel == @third_wheel
    puts "You won!"
  elsif @first_wheel == @second_wheel || @second_wheel == @third_wheel || @first_wheel == @third_wheel
    puts "You broke even."
  else 
    puts "You lost"
  end
  continue
end


def continue
    puts "would you like to play again? y/n"
    y_n = gets.strip.downcase
    if y_n == "y"
      pull_the_lever
    elsif y_n == "n"
      puts "thanks for playing"
    else
      puts "didnt understand"
      continue
    end
end



end

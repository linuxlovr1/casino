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
      puts "Welcome to the slot machine! Have a pull!\n\n"
      bet
    end

 def bet
   puts "You have $#{@player.amount}"
   puts "Each pull is $2.00\nHow much do you want to deposit?\n\n"
   @deposit = gets.strip.to_i
   bet_choice
end

def bet_choice
  if @deposit <= 0
    puts "you need to bet\n\n"
    bet
  elsif @deposit > @player.amount
    puts "you dont have enough money\n\n"
    bet
  else
    @player.amount -= @deposit
    puts "#{@player.amount} remaining\n\n"
    @remaining_balance = @deposit
    pull_the_lever
  end
end

def pull_the_lever
  puts "Remaining amount to pull: $#{@remaining_balance}"
  puts "Press enter to pull the lever"
  gets
  @remaining_balance -= 2
    if @remaining_balance <= 0
      puts "deposit more money\n\n"
      bet
    else
      spin_wheels
  end
end

def spin_wheels
  puts "The wheels are spinning...."
   @first_wheel = @wheel_1.sample
   @second_wheel = @wheel_2.sample
   @third_wheel = @wheel_3.sample
   puts "#{@first_wheel} #{@second_wheel} #{@third_wheel}\n\n"
   did_you_win
end

def did_you_win
  if @first_wheel == @second_wheel && @second_wheel == @third_wheel
    puts "You won #{@deposit}!"
    @remaining_balance += @deposit
    puts @remaining_balance
  elsif @first_wheel == @second_wheel || @second_wheel == @third_wheel || @first_wheel == @third_wheel
    puts "You won 10.00"
    @remaining_balance += 10
  else
    puts "You lost 10.00"
    @remaining_balance -= 10
    subtract
  end
  continue
end

def subtract
  if @remaining_balance <= 0
    puts "no more money!"
  end
end

def continue
    puts "would you like to play again? y/nn\n\n"
    y_n = gets.strip.downcase
    if y_n == "y"
      pull_the_lever
    elsif y_n == "n"
      puts "thanks for playing"
      @player.amount += @remaining_balance
      puts "Remaining balance #{@player.amount}"
    else
      puts "didnt understand"
      continue
    end
end



end

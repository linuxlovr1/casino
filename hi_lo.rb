require_relative "deck"
require_relative "player"

class Hi_lo
  attr_accessor :guess

  def initialize
    puts """Welcome to the hi lo game.\nheres how it works we have a card, and you have to guess if it is a high or low card"
    puts "2 - 7 are low cards, 8 - K are high cards and aces always win."
    @deck = Deck.new
    puts "is the card a hi or lo card? type hi or lo"
    game
  end

  def continue
    puts "would you like to play again? y/n"
    y_n = gets.strip.downcase
    if y_n == "y"
      initialize
    elsif y_n == "n"
      puts "thanks for playing"
    else
      puts "didnt understand"
      continue
    end
  end

  def game
    @guess = gets.strip.to_s
    @number = @deck.ranks.sample.downcase
    puts @number
    low_value = "234567"
    high_value = "8910jqk"
    if @guess != "lo" && @guess != "hi"
      puts "didnt understand try again"
      game
    elsif @guess == "lo" && low_value.include?(@number)
      puts "good job bro"
    elsif @guess == "hi" && high_value.include?(@number)
      puts "good job bro"
    elsif @number.include?("a")
      puts "it was an ace i win"
    else
      puts "sorry you lose!"
    end
    continue
  end
end

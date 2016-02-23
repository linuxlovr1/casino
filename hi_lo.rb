#N=================NO TOUCHY===================================

require_relative "deck"
require_relative "player"

class Hi_lo
  attr_accessor :guess

  def initialize(player)
    @player = player
    puts """Welcome #{player.name} to the hi lo game.\nheres how it works we have a card, and you have to guess if it is a high or low card"
    puts "2 - 7 are low cards, 8 - K are high cards and aces always win."
    @deck = Deck.new
    start
  end

  def start
    puts "whats your bet?"
    puts "you have #{@player.amount}"
    @bet = gets.strip.to_i
    if @bet > @player.amount
      puts "youre poor bro, new amount"
      start
    else
      puts "is the card a hi or lo card? type hi or lo"
      game
    end
  end

  def game
    @guess = gets.strip.to_s
    @number = @deck.ranks.sample.downcase
    puts "the card was: #{@number} so..."
    low_value = "234567"
    high_value = "8910jqk"
    if @guess != "lo" && @guess != "hi"
      puts "didnt understand try again"
      game
    elsif @guess == "lo" && low_value.include?(@number) || @guess == "hi" && high_value.include?(@number)
      add
    elsif @number.include?("a")
      puts "I win"
      subtract
    else
      puts "sorry you lose!"
      subtract
    end
    continue
  end

  def continue
    puts "would you like to play again? y/n"
    y_n = gets.strip.downcase
    if y_n == "y"
      start
    elsif y_n == "n"
      puts "thanks for playing"
    else
      puts "didnt understand"
      continue
    end
  end

  def add
    puts "good job bro"
    @player.amount += @bet
    puts "your new amount is #{@player.amount}"
  end

  def subtract
    puts "sorry you lose"
    @player.amount -= @bet
    if @player.amount <= 0
      puts "sorry bro, you lose"
      Exit
    else
      puts "your new amount is #{@player.amount}"
    end
  end
end

#N=================NO TOUCHY===================================

require_relative "deck"
require_relative "player"

class Hi_lo
  attr_accessor :guess

  def initialize(player)
    @player = player
    @deck = Deck.new
    puts """Welcome #{player.name} to the hi lo game.\nheres how it works we have a card, and you have to guess if it is a high or low card"
    puts "2 - 7 are low cards, 8 - K are high cards and aces always win.\n\n"
    start
  end

  def start
    puts "whats your bet?"
    puts "you have $#{@player.amount}"
    print "$"
    @bet = gets.strip.to_i
    bet
  end

  def bet
    if @bet > @player.amount
      puts "youre poor bro, new amount\n\n"
      start
    elsif @bet <= 0
      puts "you need to place a bet"
      start
    else
      puts "is the card a hi or lo card? type hi or lo\n\n"
      game
    end
  end

  def game
    @guess = gets.strip.to_s
    @number = @deck.ranks.sample.downcase
    puts "the card was: #{@number} so..."
    @low_value = "234567"
    @high_value = "8910jqk"
    game_guess
  end

  def game_guess
    if @guess != "lo" && @guess != "hi"
      puts "didnt understand try again"
      game
      continue
    elsif @guess == "lo" && @low_value.include?(@number) || @guess == "hi" && @high_value.include?(@number)
      add
      continue
    else
      subtract
    end
  end

  def continue
    puts "would you like to play again? y/n"
    y_n = gets.strip.downcase
    if y_n == "y"
      start
    elsif y_n == "n"
      puts "thanks for playing\n"
    else
      puts "didnt understand\n"
      continue
    end
  end

  def add
    puts "good job bro"
    @player.amount += @bet
    puts "your new amount is $#{@player.amount}\n\n"
  end

  def subtract
    puts "sorry you lose"
    @player.amount -= @bet
    if @player.amount <= 0
      puts "sorry bro, you have no money"
    else
      puts "your new amount is $#{@player.amount}\n\n"
      continue
    end

  end
end

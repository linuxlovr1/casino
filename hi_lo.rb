require_relative "deck"

class Hi_lo
  attr_accessor :guess

  def initialize
    puts """Welcome to the hi lo game.\nheres how it works we have a card, and you have to guess if it is a high or low card"
    puts "2 - 7 are low cards, 8 - K are high cards and aces allways win."
    @deck = Deck.new
    puts "is the card a hi or lo card? type hi or lo"
    @guess = gets.strip
    low
  end

  def low
    @number = @deck.ranks
    puts @number
  end

  def game

    if @guess == "lo" && number >= 7
      puts "good job"
    else
      puts "wrong"
    end
  end
end

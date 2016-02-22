require_relative "deck"

class Hi_lo

  def initialize
    puts """
    Welcome to the hi lo game.
    heres how it works we have a card, and you have to guess if it is a high or low card
    2 - 7 are low cards, 8 - K are high cards and aces allways win.
    """
    game
  end

  def game
    deck = Deck.new
  end
end

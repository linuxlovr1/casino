require_relative "deck"
require_relative "player"
class BlackJack
  def initialize(player)
  end  
end


deck = Deck.new

def assign_value
  @face = "jqk"
  @ace = "a"
  rand_card = decks.ranks.sample
  if deck.ranks.include?(@face)
    @card_value = 10
  elsif deck.ranks.include?(@ace)
end
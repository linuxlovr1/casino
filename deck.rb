class Card
 # Getter and Setter methods for rank, suit and color
 attr_accessor :rank, :suit, :bjv
 # Gets called when you call the new method to create an instance
 def initialize(rank, bjv, suit, color)
   @rank = rank
   @bjv = bjv
   @suit = suit
   @color = color
 end
 def to_s
   "#{@rank} of #{@suit}" 
 end
end

class Deck
 # Getter and Setter methods for rank, suit and color
 attr_accessor :cards, :ranks, :suits
 # Gets called when you call the new method to create an instance
 def initialize
   @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
   @bjv = [11, 2,3,4,5,6,7,8,9,10,10,10,10]
   @suits = %w(Spades Diamonds Clubs Hearts)
   @cards = []
   generate_deck
   @cards.shuffle!
 end

 def generate_deck
  @cards = []
   @suits.each do |suit|
     @ranks.size.times do |i|
       # Ternary Operator
       color = (i % 2 == 0) ? 'Black' : 'Red'
       @cards << Card.new(@ranks[i], @bjv[i], suit, color)
     end
   end
 end
 
 def deal
   @cards.pop
 end 
end



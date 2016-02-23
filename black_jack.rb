require_relative "deck"
require_relative "player"
class BlackJack
  def initialize(player)
    @player = player
    @deck = Deck.new
    puts "Welcom to Ruby BlackJack!"
    start
  end  
    
    def start
      puts "How much would you like to bet?"
      puts "You have $#{@player.amount}"
      bet = gets.strip
    end 


      def deal
      @face = "jqk"
      @ace = "a"
      rand_card = @deck.ranks.sample
      if rand_card.include?(@face)
        @card_value = 10
        puts @card_value
      elsif rand_card.include?(@ace)
        puts @card_value = 1
      end
    end
end
require_relative "deck"
require_relative "player"
class BlackJack
  def initialize(player)
    @player = player
    @deck = Deck.new
    @hand = []
    puts "Welcom to Ruby BlackJack!"
    start
  end  
    
    def start
      puts "How much would you like to bet?"
      puts "You have $#{@player.amount}"
      bet = gets.strip
      card = @deck.deal
      play_bj
      
    end 


      def play_bj
        puts "Deal Cards? y/n"
        bj_yn = gets.strip.downcase
        if bj_yn == "y"
          yes_deal
        elsif "n"
          puts "thanks for playing!"
        else 
          puts "what did you say?"
          play_bj
        end
      end
        
      def yes_deal
        @hand.push(@deck.deal.bjv, @deck.deal.bjv)
        @first_deal = "#{@hand[0]} and #{@hand[1]}"
        puts @first_deal
        @hand_total = @hand.reduce(:+)
        puts "(#{@hand_total})\n\n"
        hit_or_stay
        
      end
      
      def hit_or_stay
        puts "what would you like to do?\n1.Hit\n2.Stay"
        hitstay = gets.strip.to_i
         if hitstay == 1
           hit
         elsif hitstay == 2 
           stay
         else
           "didn't get that"
           hit_or_stay
         end  
      end  
        
      def hit
        new_card = @deck.deal.bjv
        puts new_card
        @hand << new_card
        puts @first_deal + "#{@hand_total}"
        hit_or_stay
      end  


end


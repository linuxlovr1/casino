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
          @hand.push(@deck.deal.bjv, @deck.deal.bjv)
          deal_or_hit
        elsif "n"
          puts "thanks for playing!"
        else 
          puts "what did you say?"
          play_bj
        end
      end

      
      def deal_or_hit
        @hand.each {|card| print "#{card} "}
        @hand_total = @hand.reduce(:+)
        puts " (#{@hand_total})"
          if @hand_total > 21 && @hand.include?(11)
            @deck.deal.bjv[0] == 1
            puts "(#{@hand_total}) "
            hit_or_stay
          elsif @hand_total > 21 
            puts "#{@hand_total}... Busted!"
          else  
            hit_or_stay
          end
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
        deal_or_hit
        hit_or_stay
      end  
      
      def stay
        computer_play
      end


end


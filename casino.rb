require_relative "player"

class Casino

  def initialize
    puts "---Welcome to the Ruby Casino---\nplease type your name"
    print ">"
    @player_name = gets.strip
    menu
  end

  def menu
    puts "okay #{@player_name} lets start. what would you like to do?"
    puts "1. See Wallet\n2. Play Hi-Lo\n3. Play Slots\n4. Exit"
    @where = gets.strip.to_i
    case @where
      when 1
        puts "total amount: #{@amount}"
        menu
      when 2
        #Hi-Lo
      when 3
        #Slots
      when 4
        "Thank you come again, your final amount was #{@amount}"
  end

end

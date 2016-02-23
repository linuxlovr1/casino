class Player
  attr_accessor :name, :amount

	def initialize
    puts "Type your Name please"
    @name = gets.strip
		puts "Your player name is #{@name}"
		wallet
 end

  def wallet
    	@amount = rand(100..1000)
      puts "your starting amount is: #{@amount}"
    end
  end

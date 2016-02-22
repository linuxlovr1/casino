class Player
  attr_accessor :name, :amount

	def initialize
    @name = gets.strip
		puts "Your player name is #{@name}"
		wallet
    end

    def wallet
    	@amount = rand(100..1000)
      puts "your starting amount is: #{@amount}"
    end
end

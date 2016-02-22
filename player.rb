class Player
  attr_accessor :name, :amount

	def initialize
    @name = gets.strip
		puts "Your player name is #{@name}"
		wallet
 end

  def wallet
    	@amount = rand(100..1000)
<<<<<<< HEAD
      puts "your starting amount is: #{@amount}"
    end
=======
  end
>>>>>>> 3bba217d473173f6b2eea7a10a2d176ed0c658fb
end

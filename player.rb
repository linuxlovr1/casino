class Player
  attr_accessor :name, :amount

	def initialize
    @name = gets.strip
		puts "Your player name is #{@name}"
		wallet
 end

  def wallet
    	@amount = rand(100..1000)
  end
end

class Player
	def initialize
		@player_name = gets.strip
		puts "Your player name is #{@player_name}"
		wallet
  end
    
  def wallet
    @amount = rand(100..1000)
  end
end

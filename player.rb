class Player
	def initialize
		puts "Your player name is #{@player_name}"
    end
    def wallet
    	@amount = rand(100..1000)
    end
end

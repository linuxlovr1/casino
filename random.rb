require_relative "player"
class RandomEvent
  def initialize(player)
    @player = player
    event = rand(1..15)
    case event
    when 2
      puts "Got attacked by Grandma lost $100" 
      @player.amount -= 100
    when 4
      puts "Found a drunk man you rob him. Found $200"
      @player.amount += 200
    when 6
      puts "Got attacked by a tiger, everyone dies."
      exit
    else
    end

    if @player.amount <= 0
      puts "sorry you lost all your money"
      exit
    else  
    end
  end
end
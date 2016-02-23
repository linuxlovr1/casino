require_relative "player"
class RandomEvent
  def initialize(player)
    @player = player
    event = rand(1..15)
    case event
    when 2
      grandma = rand(1..300)
      puts "Got attacked by Grandma and lost $#{grandma}" 
      @player.amount -= grandma
    when 4
      robber = rand(1..500)
      @player.amount += robber
      puts "Found a drunk man you rob him. Found $#{robber}"
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
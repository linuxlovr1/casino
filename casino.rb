require "pry"
require_relative "player"
require_relative "hi_lo"
require_relative "slots"

class Casino

  def initialize
    puts "---Welcome to the Ruby Casino---\nplease type your name"
    print ">"
    @player = Player.new
    menu
  end

  def menu
    @name = @player.name
    @amount = @player.amount
    puts "okay #{@name} lets start. what would you like to do?"
    puts "1. See Wallet\n2. Play Hi-Lo\n3. Play Slots\n4. Exit"
    menu_choice
  end

  def menu_choice
    @where = gets.strip.to_i
    case @where
      when 1
        puts "total amount: #{@amount}"
      when 2
        hi_lo = Hi_lo.new(@player)
      when 3
        slots = Slots.new(@player)
      when 4
        puts "Thank you come again, your final amount was #{@amount}"
        exit
      else
        puts "sorry that wasnt a selection, try again"
      end
      menu
  end
end


game = Casino.new

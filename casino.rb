require "pry"
require_relative "player"
require_relative "hi_lo"
require_relative "slots"

class Casino
  attr_accessor :player


  def initialize
    @player_list = []
    puts "---Welcome to the Ruby Casino---"
    @player = Player.new
    @player_list << @player
    menu
  end

  def menu
    @name = @player.name
    @amount = @player.amount
    puts "okay #{@name} lets start. what would you like to do?"
    puts "1. See Wallet\n2. Play Hi-Lo\n3. Play Slots\n4. New Player\n5. Player Menu\n6. Exit"
    menu_choice
  end
  
  def switch_player
    puts "Select Player: "
    @player_list.each_with_index {  |name, i| puts "#{i+1}: #{name.name} $#{name.amount}" }
    current_player
  end
  
  def current_player
    player_select = gets.strip.to_i
    @player = @player_list[player_select - 1]
    puts @player.name
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
        @player = Player.new
        @player_list << @player
      when 5
        switch_player
      when 6
        puts "Thank you come again, your final amount was #{@amount}"
        exit
      else
        puts "sorry that wasnt a selection, try again"
      end
      menu
  end
end

 
game = Casino.new

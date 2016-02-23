require "pry"
require_relative "player"
require_relative "hi_lo"
require_relative "slots"
require_relative "random"
require_relative "black_jack"

class Casino
  attr_accessor :player


  def initialize
    @player_list = []
    puts "---Welcome to the Ruby Casino---\n\n"
    @player = Player.new
    @player_list << @player
    menu
  end

  def menu
    @name = @player.name
    @amount = @player.amount
    puts "okay #{@name} lets start. what would you like to do?\n\n"
    puts "1. See Wallet\n2. Play Hi-Lo\n3. Play Slots\n4. BlackJack\n5. New Player\n6. Player Menu\n7. Exit"
    menu_choice
  end

  def switch_player
    puts "Select Player:\n\n"
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
        random = RandomEvent.new(@player)
        hi_lo = Hi_lo.new(@player)
      when 3
        random = RandomEvent.new(@player)
        slots = Slots.new(@player)
      when 4
        random = RandomEvent.new(@player)
        black_jack = BlackJack.new(@player)
      when 5
        @player = Player.new
        @player_list << @player
      when 6
        switch_player
      when 7
        puts "Thank you come again, your final amount was #{@amount}"
        exit
      else
        puts "sorry that wasnt a selection, try again"
      end
      menu
  end
end


game = Casino.new

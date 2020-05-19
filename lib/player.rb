class Player
  attr_reader :name, :symbol

  def initialize (num, duplicate_symbol = nil)
    puts "What is the name of player ##{num}?"
    @name = gets.chomp
    puts "What 1 letter/character would you like to be your game marker?"
    puts "It can not be '#{duplicate_symbol}'." if num == 2
    @symbol = gets.chomp until @symbol.to_s.length == 1 && @symbol != duplicate_symbol
  end

end

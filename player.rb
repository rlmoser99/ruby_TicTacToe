class Player
    @@player_count = 0
    attr_reader :name, :symbol

    def initialize (duplicate_symbol = nil)
        @@player_count += 1
        puts "What is the name of player ##{@@player_count}?"
        @name = gets.chomp
        puts "What 1 letter/character would you like to be your game marker?"
        puts "It can not be '#{duplicate_symbol}'." if @@player_count == 2
        @symbol = gets.chomp until @symbol.to_s.length == 1 && @symbol != duplicate_symbol
    end

end

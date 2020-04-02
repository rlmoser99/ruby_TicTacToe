class Game

    def start
        puts "Let's play a simple Tic-Tac-Toe game in the console!"
        @player_1 = Player.new
        @player_2 = Player.new(@player_1.symbol)
        @board = Board.new
        @board.show
    end

    def turn (player)
        puts "#{player.name}, please enter a number (1-9) that is available to place an '#{player.symbol}'"
        cell = gets.chomp until (@board.cells[cell.to_i - 1] === cell.to_i)
        @board.cells[cell.to_i - 1] = player.symbol
        @board.show
    end

    def winner (player)
        three_in_a_row = false
        winning_combinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
        ]
        winning_combinations.each do | combination |
            three_in_a_row = true if combination.all? {| cell | @board.cells[cell] == player.symbol}   
        end
        puts "GAME OVER! #{player.name} is the winner!" if three_in_a_row
        three_in_a_row
    end

    def play
        self.start
        until @board.full?(@player_1.symbol, @player_2.symbol)
            self.turn(@player_1)
            break if @board.full?(@player_1.symbol, @player_2.symbol)
            break if self.winner(@player_1)
            self.turn(@player_2)
            break if self.winner(@player_2)
        end
        puts "It's a draw." if @board.full?(@player_1.symbol, @player_2.symbol) && (!self.winner(@player_1) || !self.winner(@player_2))
        puts ""
        puts "Would you like to play a new game? Press 'y' for yes or 'n' for no."
        repeat_game = gets.chomp.downcase
        Game.new.play if repeat_game == "y"
        puts "Ok. Have a great day, #{@player_1.name} and #{@player_2.name}!" if repeat_game == "n"
    end

end
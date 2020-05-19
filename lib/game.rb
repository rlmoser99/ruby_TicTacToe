# frozen_string_literal: true

class Game
  attr_reader :player_1, :player_2

  def start
    puts "Let's play a simple Tic-Tac-Toe game in the console!"
    puts ''
    @player_1 = Player.new('1')
    puts ''
    @player_2 = Player.new('2', @player_1.symbol)
    @board = Board.new
    @board.show
  end

  def turn(player)
    puts "#{player.name}, please enter a number (1-9) that is available to place an '#{player.symbol}'"
    cell = gets.chomp until @board.cells[cell.to_i - 1] === cell.to_i
    @board.cells[cell.to_i - 1] = player.symbol
    @board.show
  end

  def winner(player)
    three_in_a_row = false
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
    ]
    winning_combinations.each do |combination|
      if combination.all? { |cell| @board.cells[cell] == player.symbol }
        three_in_a_row = true
      end
    end
    puts "GAME OVER! #{player.name} is the winner!" if three_in_a_row
    three_in_a_row
  end

  def play
    start
    until @board.full?(@player_1.symbol, @player_2.symbol)
      turn(@player_1)
      break if @board.full?(@player_1.symbol, @player_2.symbol)
      break if winner(@player_1)

      turn(@player_2)
      break if winner(@player_2)
    end
    if !winner(@player_1) && !winner(@player_2) && @board.full?(@player_1.symbol, @player_2.symbol)
      puts "It's a draw."
    end
    puts ''
    puts "Would you like to play a new game? Press 'y' for yes or 'n' for no."
    repeat_game = gets.chomp.downcase
    Game.new.play if repeat_game == 'y'
    if repeat_game == 'n'
      puts "Ok. Have a great day, #{@player_1.name} and #{@player_2.name}!"
    end
  end
end

# frozen_string_literal: true

require './display'

# Contains the logic to play the game
class Game
  include Display
  attr_reader :player1, :player2

  def initialize
    puts display_intro
    @player1 = create_player(1)
    @player2 = create_player(2, player1.symbol)
    play
  end

  def create_player(number, duplicate_symbol = nil)
    puts display_name_prompt(number)
    name = gets.chomp
    symbol = symbol_input(duplicate_symbol)
    Player.new(name, symbol)
  end

  def symbol_input(duplicate)
    loop do
      puts display_symbol_prompt
      puts display_first_symbol(duplicate) if duplicate
      @input = gets.chomp
      break if @input.match?(/^.$/) && @input != duplicate

      puts display_input_warning
    end
    @input
  end

  def start
    @board = Board.new
    @board.show
  end

  def turn(player)
    puts "#{player.name}, please enter a number (1-9) that is available to place an '#{player.symbol}'"
    cell = gets.chomp until @board.cells[cell.to_i - 1] == cell.to_i
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
    # until @board.full?(@player1.symbol, @player2.symbol)
    #   turn(@player1)
    #   break if @board.full?(@player1.symbol, @player2.symbol)
    #   break if winner(@player1)

    #   turn(@player2)
    #   break if winner(@player2)
    # end
    # if !winner(@player1) && !winner(@player2) && @board.full?(@player1.symbol, @player2.symbol)
    #   puts "It's a draw."
    # end
    # puts ''
    # puts "Would you like to play a new game? Press 'y' for yes or 'n' for no."
    # repeat_game = gets.chomp.downcase
    # Game.new.play if repeat_game == 'y'
    # if repeat_game == 'n'
    #   puts "Ok. Have a great day, #{@player1.name} and #{@player2.name}!"
    # end
  end
end

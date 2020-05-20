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
    play_game
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

  def turn(player)
    cell = turn_input(player)
    @board.cells[cell.to_i - 1] = player.symbol
    @board.show
  end

  def turn_input(player)
    loop do
      puts display_player_turn(player.name, player.symbol)
      @number = gets.chomp
      break if @board.cells[@number.to_i - 1] == @number.to_i

      puts display_input_warning
    end
    @number
  end

  def turn_order
    until @board.full?(@player1.symbol, @player2.symbol)
      turn(@player1)
      break if @board.full?(@player1.symbol, @player2.symbol)
      break if @board.game_over?

      turn(@player2)
      break if @board.game_over?
    end
    # re-work this to easily show who the winner is
  end

  def repeat_game
    puts display_play_again
    repeat_input = gets.chomp.downcase
    Game.new if repeat_input == 'y'
    puts closing_greeting(@player1.name, @player2.name) if repeat_input == 'n'
  end

  def play_game
    @board = Board.new
    @board.show
    turn_order
    # puts "GAME OVER! #{player.name} is the winner!" if three_in_a_row
    # if !winner(@player1) && !winner(@player2) && @board.full?(@player1.symbol, @player2.symbol)
    #   puts "It's a draw."
    # end
    repeat_game
  end
end

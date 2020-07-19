# frozen_string_literal: true

require_relative 'display.rb'

# Contains the logic to play the game
class Game
  include Display
  attr_reader :first_player, :second_player

  def initialize
    @board = Board.new
  end

  # TooManyStatements
  def play
    puts display_intro
    create_game_players
    @board.show
    player_turns
    conclusion
    repeat_game
  end

  def create_game_players
    @first_player = create_player(1)
    @second_player = create_player(2, first_player.symbol)
  end

  private

  def create_player(number, duplicate_symbol = nil)
    puts display_name_prompt(number)
    name = gets.chomp
    # Update symbol to not be able to use a digit 0-9 because of full? check.
    symbol = symbol_input(duplicate_symbol)
    Player.new(name, symbol)
  end

  # TooManyStatements
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
    @board.update_board(cell - 1, player.symbol)
    # @board.cells[cell.to_i - 1] = player.symbol
    @board.show
  end

  # TooManyStatements
  def turn_input(player)
    loop do
      puts display_player_turn(player.name, player.symbol)
      @number = gets.chomp.to_i
      break if @board.cells[@number - 1] == @number

      puts display_input_warning
    end
    @number
  end

  def player_turns
    @current_player = @first_player
    until @board.full?
      turn(@current_player)
      break if @board.game_over?

      switch_current_player
    end
    @winner = @current_player
  end

  def switch_current_player
    @current_player = if @current_player == @first_player
                        @second_player
                      else
                        @first_player
                      end
  end

  def conclusion
    if @winner
      puts display_winner(@winner.name)
    else
      puts display_tie
    end
  end

  def repeat_game
    puts display_play_again
    repeat_input = gets.chomp.downcase
    Game.new if repeat_input == 'y'
    if repeat_input != 'y'
      puts closing_greeting(@first_player.name, @second_player.name)
    end
  end
end

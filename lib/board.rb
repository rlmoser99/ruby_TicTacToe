# frozen_string_literal: true

# Tic-Tac-Toe Board
class Board
  attr_accessor :cells
  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # rubocop:disable Metrics/AbcSize
  def show
    puts <<-HEREDOC

       #{cells[0]} | #{cells[1]} | #{cells[2]}
      ---+---+---
       #{cells[3]} | #{cells[4]} | #{cells[5]}
      ---+---+---
       #{cells[6]} | #{cells[7]} | #{cells[8]}

    HEREDOC
  end
  # rubocop:enable Metrics/AbcSize

  def full?(symbol1, symbol2)
    @cells.all? { |cell| cell == symbol1 || cell == symbol2 }
  end
end

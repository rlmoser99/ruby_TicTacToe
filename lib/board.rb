class Board
  attr_accessor :cells
  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show
    puts <<-HEREDOC

       #{cells[0]} | #{cells[1]} | #{cells[2]}
      ---+---+---
       #{cells[3]} | #{cells[4]} | #{cells[5]}
      ---+---+---
       #{cells[6]} | #{cells[7]} | #{cells[8]}

    HEREDOC
  end

  def full?(symbol_1, symbol_2)
    @cells.all?{ | cell | cell == symbol_1 || cell == symbol_2}
  end

end
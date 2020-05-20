# frozen_string_literal: true

# spec/board_spec.rb

require_relative '../lib/board'

describe Board do
  context '#full? false (continue game) & true (end game)' do
    it 'empty board is false' do
      board = Board.new
      expect(board.full?('x', 'o')).to be false
    end

    it 'half-used board is false' do
      board = Board.new
      board.cells = %w[x 2 o 4 5 o x 8 o]
      expect(board.full?('x', 'o')).to be false
    end

    it 'full board is true' do
      board = Board.new
      board.cells = %w[x x o o x o x o o]
      expect(board.full?('x', 'o')).to be true
    end
  end
end

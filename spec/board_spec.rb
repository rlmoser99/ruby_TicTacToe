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

  context '#game_over? false (continue game) & true (end game)' do
    it 'empty board is false' do
      board = Board.new
      expect(board.game_over?).to be false
    end

    it 'half-played game is false' do
      board = Board.new
      board.cells = %w[x 2 x 4 5 o o 8 o]
      expect(board.game_over?).to be false
    end

    it 'top 3 in a row is true' do
      board = Board.new
      board.cells = %w[x x x 4 5 o o 8 o]
      expect(board.game_over?).to be true
    end

    it 'horizontal middle 3 in a row is true' do
      board = Board.new
      board.cells = %w[1 x 3 o o o x 8 x]
      expect(board.game_over?).to be true
    end

    it 'bottom 3 in a row is true' do
      board = Board.new
      board.cells = %w[1 o o 4 o 6 x x x]
      expect(board.game_over?).to be true
    end

    it 'left 3 in a row is true' do
      board = Board.new
      board.cells = %w[x 2 o x o 6 x 8 o]
      expect(board.game_over?).to be true
    end

    it 'vertical middle 3 in a row is true' do
      board = Board.new
      board.cells = %w[x o 3 4 o x 7 o x]
      expect(board.game_over?).to be true
    end

    it 'right 3 in a row is true' do
      board = Board.new
      board.cells = %w[1 o x 4 o x o 8 x]
      expect(board.game_over?).to be true
    end

    it 'diagonal \ 3 in a row is true' do
      board = Board.new
      board.cells = %w[o 2 x 4 o x 7 x o]
      expect(board.game_over?).to be true
    end

    it 'diagonal / 3 in a row is true' do
      board = Board.new
      board.cells = %w[o o x 4 x 6 x o 9]
      expect(board.game_over?).to be true
    end
  end
end

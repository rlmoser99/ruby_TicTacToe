# frozen_string_literal: true

# spec/board_spec.rb

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#full?' do
    context 'when board is new' do
      it 'is not full' do
        expect(board.full?).to be false
      end
    end

    context 'when board is partially used' do
      before do
        board.instance_variable_set(:@cells, %w[x 2 o 4 5 o x 8 o])
      end

      it 'is not full' do
        expect(board.full?).to be false
      end
    end

    context 'when board is completely full' do
      before do
        board.instance_variable_set(:@cells, %w[x x o o x o x o o])
      end

      it 'is full' do
        expect(board.full?).to be true
      end
    end
  end

  describe '#game_over?' do
    context 'when board is new' do
      it 'is not game over' do
        expect(board).not_to be_game_over
      end
    end

    context 'when board is half-played' do
      before do
        board.instance_variable_set(:@cells, %w[x 2 x 4 5 o o 8 o])
      end

      it 'is not game over' do
        expect(board).not_to be_game_over
      end
    end

    context 'when there is a horizontal 3-in-a-row' do
      before do
        board.instance_variable_set(:@cells, %w[x x x 4 5 o o 8 o])
      end

      it 'is game over' do
        expect(board).to be_game_over
      end
    end

    context 'when there is a vertical 3-in-a-row' do
      before do
        board.instance_variable_set(:@cells, %w[x o 3 4 o x 7 o x])
      end

      it 'is game over' do
        expect(board).to be_game_over
      end
    end

    context 'when there is a diagonal 3-in-a-row' do
      before do
        board.instance_variable_set(:@cells, %w[o 2 x 4 o x 7 x o])
      end

      it 'is game over' do
        expect(board).to be_game_over
      end
    end
  end
end

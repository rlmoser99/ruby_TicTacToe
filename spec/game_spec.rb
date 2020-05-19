# frozen_string_literal: true

# spec/game_spec.rb
require './lib/game.rb'
require './lib/player.rb'
require './lib/board.rb'

describe Game do
  subject { Game.new }
  # let(:board) { Board.new }
  # let(:player) { Player.new 1 }

  describe '#winner' do
    it 'works with blank board' do
      subject.start
      expect(subject.winner(subject.player_1)).be_false
    end
  end
end

# @board.cells = ['x', 'x', 'x', 'y', 5, 'y', 7, 8, 9]

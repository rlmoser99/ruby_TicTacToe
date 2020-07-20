# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'

describe Game do
  subject(:game) { described_class.new }

  before do
    game.instance_variable_set(:@board, instance_double(Board))
  end

  it 'plays the game' do
    expect(game).to receive(:game_set_up)
    expect(game.board).to receive(:show)
    expect(game).to receive(:player_turns)
    expect(game).to receive(:conclusion)
    expect(game).to receive(:repeat_game)
    game.play
  end
end

# rubocop:enable

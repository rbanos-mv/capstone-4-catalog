require_relative './test_helper'

# Team member 3
RSpec.describe Game do
  it 'should be an instance of Game' do
    game = create_game

    expect(game).to be_an_instance_of(Game)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Game.new }.to raise_error(ArgumentError)
  end
end
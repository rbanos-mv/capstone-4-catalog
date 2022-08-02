require_relative './test_helper'
require_relative '../classes/item.rb'
require_relative '../classes/game.rb'

# Team member 3
RSpec.describe Game do
  it 'should be an instance of Game' do
    game = Game.new('25/07/2020', '22/07/2022', true)

    expect(game).to be_an_instance_of(Game)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Game.new }.to raise_error(ArgumentError)
  end
end

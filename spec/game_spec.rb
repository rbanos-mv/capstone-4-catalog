require 'date'
require_relative './test_helper'
require_relative '../classes/item'
require_relative '../classes/game'

# Team member 3
RSpec.describe Game do
  it 'should be an instance of Game' do
    game = Game.new('Titulo', Date.parse('2002-03-26'), Date.parse('2018-07-01'), true)

    expect(game).to be_an_instance_of(Game)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Game.new }.to raise_error(ArgumentError)
  end

  it 'should archive a game if last played older than 2 years, and publish date older than 10 years' do
    game1 = Game.new('Titulo', Date.parse('2002-03-26'), Date.parse('2018-07-01'), false)
    game1.move_to_archive
    expect(game1.archived).to be true
  end

  it 'should not archive a game if last played newer than 2 years' do
    game2 = Game.new('Titulo', Date.parse('2002-03-26'), Date.today - 10, false)
    game2.move_to_archive
    expect(game2.archived).to be false
  end

  it 'should not archive a game if publish date newer than 10 years' do
    game3 = Game.new('Titulo', Date.today - (365 * 5), Date.parse('2018-07-01'), false)
    game3.move_to_archive
    expect(game3.archived).to be false
  end
end

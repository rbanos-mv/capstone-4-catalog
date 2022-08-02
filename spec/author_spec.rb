require 'date'
require_relative './test_helper'
require_relative '../classes/author'

# Team member 3
RSpec.describe Author do
  it 'should be an instance of Author' do
    author = Author.new('Juan', 'Leyrado')

    expect(author).to be_an_instance_of(Author)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Author.new }.to raise_error(ArgumentError)
  end

  it 'should add_item' do
    game1 = Game.new('Titulo', Date.parse('2016-03-26'), Date.parse('2018-07-01'), false)
    author1 = Author.new('Juan', 'Leyrado')

    author1.add_item(game1)

    expect(author1.items[0]).to eq(game1)
    expect(game1.author).to eq(author1)
  end
end

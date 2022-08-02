require_relative './test_helper'
require_relative '../classes/author.rb'

# Team member 3
RSpec.describe Author do
  it 'should be an instance of Author' do
    author = Author.new('Juan', 'Leyrado')

    expect(author).to be_an_instance_of(Author)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Author.new }.to raise_error(ArgumentError)
  end
end

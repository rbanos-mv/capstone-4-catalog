require_relative './test_helper'

# Team member 3
RSpec.describe Author do
  it 'should be an instance of Author' do
    author = create_author

    expect(author).to be_an_instance_of(Author)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Author.new }.to raise_error(ArgumentError)
  end
end

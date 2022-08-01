require_relative './test_helper'

# Team member 1
RSpec.describe Book do
  it 'should be an instance of Book' do
    book = create_book

    expect(book).to be_an_instance_of(Book)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Book.new }.to raise_error(ArgumentError)
  end
end

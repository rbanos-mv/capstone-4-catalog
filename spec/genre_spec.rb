require_relative './test_helper'

# Team member 2
RSpec.describe Genre do
  it 'should be an instance of Genre' do
    genre = create_genre

    expect(genre).to be_an_instance_of(Genre)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Genre.new }.to raise_error(ArgumentError)
  end

  it "should have id: #{genre_id}" do
    genre = create_genre

    result = genre.id

    expect(result).to eq(genre_id)
  end

  it "should have name: #{genre_name}" do
    genre = create_genre

    result = genre.name

    expect(result).to eq(genre_name)
  end
end

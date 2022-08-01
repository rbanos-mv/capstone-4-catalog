require_relative './test_helper'

# Team member 2
RSpec.describe MusicAlbum do
  it 'should be an instance of MusicAlbum' do
    music_album = create_music_album

    expect(music_album).to be_an_instance_of(MusicAlbum)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { MusicAlbum.new }.to raise_error(ArgumentError)
  end
end

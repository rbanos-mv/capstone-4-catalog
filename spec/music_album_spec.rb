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

  it "should have id: #{album_id}" do
    album = create_music_album

    result = album.id

    expect(result).to eq(album_id)
  end

  it 'should have on_spotify: true' do
    album = create_music_album

    result = album.on_spotify

    expect(result).to eq(true)
  end

  it "should have author: #{first_name} #{last_name}" do
    album = create_music_album
    album.author = author_mock

    result = "#{album.author.first_name} #{album.author.last_name}"

    expect(result).to eq("#{first_name} #{last_name}")
  end

  it "should have genre: #{genre_name}" do
    album = create_music_album
    album.genre = genre_mock

    result = album.genre.name

    expect(result).to eq(genre_name)
  end

  it "should have label: #{title} #{color}" do
    album = create_music_album
    album.label = label_mock

    result = "#{album.label.title} #{album.label.color}"

    expect(result).to eq("#{title} #{color}")
  end

  it 'should be archived because is older than 10 years' do
    album = create_music_album(older_10_years)

    album.move_to_archive
    result = album.archived

    expect(result).to eq(true)
  end

  it 'should be NOT archived because is NOT older than 10 years' do
    album = create_music_album

    album.move_to_archive
    result = album.archived

    expect(result).to eq(false)
  end

  it 'should be NOT archived because is NOT on spotify' do
    album = create_music_album(older_10_years, on_spotify: false)

    album.move_to_archive
    result = album.archived

    expect(result).to eq(false)
  end
end

require_relative '../classes/genre'
require_relative '../classes/music_album'

module MusicAlbumModule
  # Team member 2

  def ask_music_album_data
    head = 'ADD MUSIC ALBUM'.center(50)
    puts "\n#{head}"
    [
      string_input('Album title: '),
      date_input('Publish date: '),
      letter_input('Is it on Spotify? (Y/N) ', %w[Y N]),
      select_genre
    ]
  end

  def add_music_album
    title, publish_date, on_spotify, genre = ask_music_album_data
    album = MusicAlbum.new(title, publish_date, on_spotify: on_spotify)
    album.genre = @genres[genre]
    @albums << album
  end

  def list_music_albums
    header, line = MusicAlbum.header(empty: @albums.empty?)
    if @albums.empty?
      puts header
    else
      list = @albums.map do |album|
        album
      end.join("\n")
      puts "#{header}\n#{list}\n#{line}"
    end
  end
end

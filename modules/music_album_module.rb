require_relative '../classes/genre'
require_relative '../classes/music_album'

module MusicAlbumModule
  # Team member 2

  def ask_music_album_data
    head = 'ADD MUSIC ALBUM'.center(50)
    puts "\n#{head}"
    [
      string_input('Title: ').capitalize,
      date_input('Publish date: '),
      boolean_input('Is it on Spotify? (y/n) ')
    ]
  end

  def add_music_album
    title, publish_date, on_spotify = ask_music_album_data
    album = MusicAlbum.new(title, publish_date, on_spotify: on_spotify)

    album.genre = add_genre

    @albums << album
  end

  def list_music_albums
    header, line = MusicAlbum.header
    tname = 'ALL ALBUMS'.center(line.length)
    puts "\n#{tname}\n#{line}"

    if @albums.empty?
      puts '*** EMPTY LIST ***'.center(line.length)
    else
      table = @albums.map do |album|
        album
      end.join("\n")
      puts "#{header}\n#{line}\n#{table}"
    end
    puts line
  end
end

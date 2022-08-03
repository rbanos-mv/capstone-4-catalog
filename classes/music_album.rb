require_relative './item'

class MusicAlbum < Item
  # Team member 2
  attr_reader :on_spotify

  def initialize(title, publish_date, id = Random.rand(1..1000), on_spotify: false)
    super(title, publish_date, id)
    @on_spotify = on_spotify
  end

  def self.header_name
    'MUSIC ALBUMS'
  end

  def self.header(full: true, margin: 0, empty: false)
    id_col = full ? '|    ID ' : ''
    genre_col = 'GENRE'.ljust(30)
    title_col = 'TITLE'.ljust(30)
    publish_col = 'PUBLISHED'.center(10)
    spotify_col = 'SPOTIFY'.center(7)

    row = "#{id_col}| #{genre_col} | #{title_col} | #{publish_col} | #{spotify_col} |"
    width = row.length + margin
    line = ''.center(row.length, '-').rjust(width)
    row = '*** EMPTY LIST ***'.center(row.length) if empty
    entity_name = MusicAlbum.header_name.center(row.length)

    ["\n#{entity_name}\n#{line}\n#{row.rjust(width)}\n#{line}", line]
  end

  def to_s(full: true, margin: 0)
    id_col = full ? "| #{id.to_s.rjust(5)} " : ''
    genre_col = genre.name.ljust(30)
    title_col = title.ljust(30)
    publish_col = publish_date.to_s.center(10)
    spotify_col = (on_spotify ? 'YES' : 'NO').center(7)

    row = "#{id_col}| #{genre_col} | #{title_col} | #{publish_col} | #{spotify_col} |"
    row.rjust(row.length + margin)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [title, publish_date, id, on_spotify, genre]
    }.to_json(*args)
  end

  def self.json_create(object)
    title, publish_date, id, on_spotify, genre = object['data']
    object = new(title, publish_date, id, on_spotify: on_spotify)
    object.genre = genre
    object
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end

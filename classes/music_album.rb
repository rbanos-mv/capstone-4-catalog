require_relative './item'

class MusicAlbum < Item
  # Team member 2
  attr_reader :on_spotify

  def initialize(title, publish_date, id = Random.rand(1..1000), on_spotify: false)
    super(title, publish_date, id)
    @on_spotify = on_spotify
  end

  def self.row_generator(id, genre, title, publish, spotify)
    "| #{id.to_s.rjust(4)} | #{genre.ljust(20)} | #{title.ljust(20)} \
| #{publish.to_s.ljust(10)} | #{spotify.ljust(7)} |"
  end

  def self.header
    width = 77
    [
      row_generator('ID', 'GENRE', 'TITLE', 'PUBLISHED', 'SPOTIFY'),
      ''.center(width, '-')
    ]
  end

  def to_s
    self.class.row_generator(id, genre.name, title, publish_date, (on_spotify ? 'YES' : 'NO'))
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

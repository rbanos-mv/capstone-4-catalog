class Game < Item
  # Team member 3
  attr_accessor :last_played_at, :multiplayer

  def initialize(title, publish_date, last_played_at, multiplayer, id = Random.rand(1..1000))
    # constructor
    super(title, publish_date, id)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def self.row_generator(params)
    id, genre_name, title, author, publish, multiplayer = params
    "| #{id.to_s.rjust(4)} | #{genre_name.ljust(15)} | #{title.ljust(20)} | #{author.ljust(20)} \
| #{publish.to_s.ljust(10)} | #{multiplayer.ljust(7)} |"
  end

  def self.header
    width = 95
    [
      row_generator(%w[ID GENRE TITLE AUTHOR PUBLISHED MULTI]),
      ''.center(width, '-')
    ]
  end

  def to_s
    author_name = "#{author.first_name} #{author.last_name}"[0...20]
    is_multiplayer = multiplayer ? 'YES' : 'NO'
    self.class.row_generator([id, genre.name, title, author_name, publish_date, is_multiplayer])
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [id, title, publish_date, last_played_at, multiplayer, author, genre]
    }.to_json(*args)
  end

  def self.json_create(object)
    id, title, publish_date, last_played_at, multiplayer, author, genre = object['data']

    object = new(title, publish_date, last_played_at, multiplayer, id)
    object.author = author
    object.genre = genre
    object
  end

  private

  def can_be_archived?
    # implementation, 2 years with one leap year
    super && (Date.today - @last_played_at).to_i > 631
  end
end

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

  def to_s
    "Id: #{id.to_s.rjust(4)} Genre: #{genre.name} Title: #{@title} Author: #{author.first_name} \
#{author.last_name} Publish date: #{publish_date} Multiplayer: #{multiplayer ? 'YES' : 'NO'}"
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

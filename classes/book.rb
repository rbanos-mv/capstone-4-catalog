require_relative 'item'

class Book < Item
  attr_reader :publisher, :cover_state, :title
  attr_accessor :published_date

  def initialize(title, published_date, publisher, cover_state, id = rand(1..1000))
    super(title, published_date, id)
    @id = id
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [title, publish_date, publisher, cover_state, id, label]
    }.to_json(*args)
  end

  def self.json_create(object)
    title, publish_date, publisher, cover_state, id, label = object['data']
    object = new(title, Date.parse(publish_date), publisher, cover_state, id)
    object.label = label
    object
  end
end

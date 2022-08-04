class Genre
  # Team member 2
  attr_reader :id, :name

  def initialize(name, id = Random.rand(1..1000))
    @name = name
    @id = id
    @items = []
  end

  def add_item(item)
    @items << item unless @items.any? { |a| a.id == item.id }
    item.genre = self unless item.genre == self
  end

  def self.row_generator(id, name)
    "| #{id.to_s.rjust(4)} | #{name.ljust(20)} |"
  end

  def self.header
    width = 31
    [
      row_generator('ID', 'NAME'),
      ''.center(width, '-')
    ]
  end

  def to_s(full: true)
    return self.class.row_generator(id, name) if full

    name_col
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [name, id]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end

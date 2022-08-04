class Label
  # Team member 1
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(title, color, id = rand(1..1000))
    # constructor
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    # implementation
    @items << item unless @items.include?(item)
    item.label = self unless item.label == self
  end

  def self.row_generator(id, title, color)
    "| #{id.to_s.rjust(4)} | #{title.ljust(20)} | #{color.ljust(20)} |"
  end

  def self.header
    width = 54
    [
      row_generator('ID', 'TITLE', 'COLOR'),
      ''.center(width, '-')
    ]
  end

  def to_s
    self.class.row_generator(id, @title, @color)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [title, color, id]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end

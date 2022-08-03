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

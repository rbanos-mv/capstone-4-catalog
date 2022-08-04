class Author
  # Team member 3
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(first_name, last_name, id = Random.rand(1..1000))
    # constructor
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    # implementation
    @items.push(item) unless @items.include?(item)
    item.author = self unless item.author == self
  end

  def self.row_generator(id, first_name, last_name)
    "| #{id.to_s.rjust(4)} | #{first_name.ljust(20)} | #{last_name.ljust(20)} |"
  end

  def self.header
    width = 54
    [
      row_generator('ID', 'FIRST NAME', 'LAST_NAME'),
      ''.center(width, '-')
    ]
  end

  def to_s
    self.class.row_generator(id, @first_name, @last_name)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [first_name, last_name, id]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end

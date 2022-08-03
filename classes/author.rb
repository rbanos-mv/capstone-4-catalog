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

  def to_s
    "Id: #{id.to_s.rjust(4)} First Name: #{@first_name} Last Name: #{@last_name}"
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

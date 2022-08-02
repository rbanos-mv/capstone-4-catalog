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
  end

  def to_s
    "id: #{id}  name: #{name}"
  end
end

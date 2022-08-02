class Label
  # Team member 1
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(id, title, color)
    # constructor
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    # implementation
    @item = item
    item.label << self
  end
end

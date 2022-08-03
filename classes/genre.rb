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

  def self.name
    'GENRES'
  end

  def self.header(full: true, margin: 0, empty: false)
    id_col = full ? '|    ID ' : ''
    name_col = 'NAME'.ljust(30)

    row = "#{id_col}| #{name_col} |"
    width = row.length + margin
    line = ''.center(row.length, '-').rjust(width)
    row = '*** EMPTY LIST ***'.center(row.length) if empty
    entity_name = Genre.name.center(row.length)

    ["\n#{entity_name}\n#{line}\n#{row.rjust(width)}\n#{line}", line]
  end

  def to_s(full: true, margin: 0)
    id_col = full ? "| #{id.to_s.rjust(5)} " : ''
    name_col = name.ljust(30)

    row = "#{id_col}| #{name_col} |"
    return row.rjust(row.length + margin) if full

    name_col
  end
end

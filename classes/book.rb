require_relative 'item'

class Book < Item
  attr_reader :publisher, :cover_state
  attr_accessor :published_date

  def initialize(published_date, publisher, cover_state)
    super(id, published_date)
    @id = rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end

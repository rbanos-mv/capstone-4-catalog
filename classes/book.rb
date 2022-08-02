require_relative 'item'

class Book < Item
  attr_reader :publisher, :cover_state, :title
  attr_accessor :published_date

  def initialize(published_date, publisher, cover_state, id = rand(1..1000))
    super(published_date, id)
    @id = id
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end

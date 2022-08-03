class Item
  attr_accessor :publish_date, :title
  attr_reader :id, :archived, :author, :genre, :label, :source

  def initialize(title, publish_date, id = Random.rand(1..1000))
    @id = id
    @archived = false
    @title = title
    @publish_date = publish_date

    @author = nil
    @genre = nil
    @label = nil
    @source = nil
  end

  def author=(new_author)
    @author = new_author
    new_author.add_item(self)
  end

  def genre=(new_genre)
    @genre = new_genre
    new_genre.add_item(self)
  end

  def label=(new_label)
    @label = new_label
    new_label.add_item(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    # There are 3652-3653 days in 10 years
    (Date.today - @publish_date).to_i > 3652
  end
end

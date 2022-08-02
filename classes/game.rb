class Game < Item
  # Team member 3
  attr_accessor :last_played_at, :multiplayer

  def initialize(title, publish_date, last_played_at, multiplayer)
    # constructor
    super(title, publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def to_s
    "id: #{id.to_s.rjust(4)} genre: #{genre.name} title: #{title} author: #{author.first_name} \
#{author.last_name} publish date: #{publish_date} multiplayer: #{multiplayer ? 'YES' : 'NO'}"
  end

  private

  def can_be_archived?
    # implementation, 2 years with one leap year
    super && (Date.today - @last_played_at).to_i > 631
  end
end

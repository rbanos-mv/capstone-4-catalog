class Game < Item
  # Team member 3
  attr_accessor :last_played_at, :multiplayer

  def initialize(publish_date, last_played_at, multiplayer)
    # constructor
    super(publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    # implementation, 2 years with one leap year
    super && (Date.today - @last_played_at).to_i > 631
  end
end

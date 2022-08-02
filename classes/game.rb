class Game < Item
  # Team member 3
  attr_accessor :last_played_at, :multiplayer

  def initialize(publish_date, last_played_at, multiplayer)
    # constructor
    super(publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  private

  def can_be_archived?
    # implementation, 2 years with one leap year
    true if super && (Time.now - @last_played_at) > 63_158_400
    false
  end
end

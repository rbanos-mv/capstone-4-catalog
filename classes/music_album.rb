require_relative './item'

class MusicAlbum < Item
  # Team member 2
  attr_reader :on_spotify

  def initialize(title, publish_date, id = Random.rand(1..1000), on_spotify: false)
    super(title, publish_date, id)
    @on_spotify = on_spotify
  end

  def to_s
    "id: #{id.to_s.rjust(4)} genre: #{genre.name} title: #{genre.title} publish date: #{publish_date} \
on spotify: #{on_spotify ? 'YES' : 'NO'}"
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end

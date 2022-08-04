require_relative '../modules/input_module'
require_relative '../modules/book_module'
require_relative '../modules/label_module'
require_relative '../modules/genre_module'
require_relative '../modules/music_album_module'
require_relative '../modules/author_module'
require_relative '../modules/game_module'
require_relative '../modules/preserve_module'

class App
  include PreserveModule

  def initialize
    @genres = []
    @albums = []
    @authors = []
    @books = []
    @games = []
    @labels = []

    load_data
  end

  include InputModule

  # *****************
  # Team member 1
  # *****************
  # book
  include BookModule

  # label
  include LabelModule

  # *****************
  # Team member 2
  # *****************
  # genre
  include GenreModule

  # music_album
  include MusicAlbumModule

  # *****************
  # Team member 3
  # *****************
  # author
  include AuthorModule

  # game
  include GameModule
end

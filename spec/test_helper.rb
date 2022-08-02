require 'json'
require_relative '../classes/book'
require_relative '../classes/genre'

# *****************
# Team member 1
# *****************
# book

# label

# *****************
# Team member 2
# *****************
# genre

def genre_id
  1
end

def genre_name
  'Genre Name'
end

def create_genre
  Genre.new(genre_name, genre_id)
end

def genre_mock
  mock = double('Genre', { name: genre_name, id: genre_id })
  allow(mock).to receive(:add_item)
  mock
end

# music_album

# *****************
# Team member 3
# *****************
# author

# game

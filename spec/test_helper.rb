require 'date'
require 'json'
require_relative '../classes/book'
require_relative '../classes/genre'
require_relative '../classes/music_album'

def publish_date
  Date.today
end

def older_2_years
  Date.today - ((365 * 2) + 10)
end

def older_10_years
  Date.today - ((365 * 10) + 10)
end

# *****************
# Team member 1
# *****************
# book

# label
def label_id
  1
end

def title
  'label title'
end

def color
  'blue'
end

def label_mock
  mock = double('Label', { title: title, color: color, id: label_id })
  allow(mock).to receive(:add_item)
  mock
end

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

def genre_mock
  mock = double('Genre', { name: genre_name, id: genre_id })
  allow(mock).to receive(:add_item)
  mock
end

def create_genre
  Genre.new(genre_name, genre_id)
end

# music_album
def album_id
  1
end

def album_title
  'Album title'
end

def album_mock
  mock = double('MusicAlbum', { name: genre_name, id: genre_id })
  allow(mock).to receive(:add_item)
  mock
end

def create_music_album(date = publish_date, on_spotify: true)
  MusicAlbum.new(album_title, date, album_id, on_spotify: on_spotify)
end

# *****************
# Team member 3
# *****************
# author
def author_id
  1
end

def first_name
  'First_name'
end

def last_name
  'Last_name'
end

def author_mock
  mock = double('Author', { first_name: first_name, last_name: last_name, id: author_id })
  allow(mock).to receive(:add_item)
  mock
end

# game

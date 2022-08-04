require 'fileutils'
require 'json'
require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../classes/label'

module PreserveModule
  def path(file_name = '')
    "./json/#{file_name}"
  end

  def deserialize(file_name, default_value = [])
    return JSON.parse(File.read(path(file_name)), create_additions: true) if File.exist?(path(file_name))

    default_value
  end

  def serialize(file_name, objects)
    File.write(path(file_name), JSON.generate(objects)) unless objects.is_a?(Array) && objects.empty?
  end

  def load_data
    FileUtils.mkdir_p(path)

    @authors = deserialize('authors.json')
    @genres = deserialize('genres.json')
    @labels = deserialize('labels.json')
    @albums = deserialize('albums.json')
    @books = deserialize('books.json')
    @games = deserialize('games.json')

    load_default_authors(@authors)
    load_default_genres(@genres)
    load_default_labels(@labels)
  end

  def save_data
    serialize('albums.json', @albums)
    serialize('authors.json', @authors)
    serialize('books.json', @books)
    serialize('games.json', @games)
    serialize('genres.json', @genres)
    serialize('labels.json', @labels)
  end

  def load_default_authors(list)
    return unless list.empty?

    defaults = [
      { first_name: 'Charles', last_name: 'Dickens' },
      { first_name: 'William', last_name: 'Faulkner' },
      { first_name: 'Ernest', last_name: 'Hemingway' },
      { first_name: 'Franz', last_name: 'Kafka' },
      { first_name: 'William', last_name: 'Shakespeare' }
    ]
    defaults.map.with_index do |default, index|
      list << Author.new(default[:first_name], default[:last_name], index + 1)
    end
  end

  def load_default_genres(list)
    return unless list.empty?

    defaults = %w[Classic Electronic HipHop Jazz Latin Pop Rock]
    defaults.map.with_index do |default, index|
      list << Genre.new(default, index + 1)
    end
  end

  def load_default_labels(list)
    return unless list.empty?

    defaults = [
      { title: 'Algorithms', color: 'Red' },
      { title: 'Classicals', color: 'Green' },
      { title: 'Education', color: 'Blue' },
      { title: 'General', color: 'Orange' },
      { title: 'Geography', color: 'White' },
      { title: 'Math', color: 'Purple' },
      { title: 'Science', color: 'Brown' }
    ]
    defaults.map.with_index do |default, index|
      list << Label.new(default[:title], default[:color], index + 1)
    end
  end
end

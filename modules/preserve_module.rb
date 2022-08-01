module PreserveModule
  def deserialize(file_name, default_value = [])
    fname = "./json/#{file_name}"
    return JSON.parse(File.read(fname), create_additions: true) if File.exist?(fname)

    default_value
  end

  def serialize(file_name, objects)
    fname = "./json/#{file_name}"
    File.write(fname, JSON.generate(objects)) unless objects.is_a?(Array) && objects.empty?
  end

  def load_data
    # app.books = deserialize('albums.json')
    # app.books = deserialize('authors.json')
    # app.books = deserialize('books.json')
    # app.books = deserialize('games.json')
    # app.books = deserialize('genres.json')
    # app.books = deserialize('labels.json')
  end

  def save_data
    # serialize('albums.json', app.albums)
    # serialize('authors.json', app.authors)
    # serialize('books.json', app.books)
    # serialize('games.json', app.games)
    # serialize('genres.json', app.genres)
    # serialize('labels.json', app.labels)
  end
end

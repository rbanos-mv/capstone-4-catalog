require_relative '../classes/game'
require_relative '../classes/genre'
require_relative '../classes/author'
require_relative '../classes/label'

module GameModule
  # Team member 3

  def ask_game_data
    title = string_input('Title of the game: ')
    publish_date = date_input('Publication date (yyyy-mm-dd): ')
    last_played_at = date_input('Last played date (yyyy-mm-dd): ')
    multiplayer = boolean_input('Is multiplayer? (y/n): ')

    author_first_name = string_input('Author First Name: ')
    author_last_name = string_input('Author Last Name: ')
    genre_name = string_input('Genre: ')
    label_title = string_input('Label Title: ')
    label_color = string_input('Label color: ')
    [title, publish_date, last_played_at, multiplayer, author_first_name, author_last_name, \
     genre_name, label_title, label_color]
  end

  def add_game
    title, publish_date, last_played_at, multiplayer, author_first_name, author_last_name, \
genre_name, label_title, label_color = ask_game_data

    game = Game.new(title, publish_date, last_played_at, multiplayer)
    author = @authors.find { |auth| auth.first_name + auth.last_name == author_first_name + author_last_name }
    if author.nil?
      author = Author.new(author_first_name, author_last_name)
      @authors.push(author)
    end
    game.author = author
    genre = @genres.find { |gen| gen.name == genre_name }
    if genre.nil?
      genre = Genre.new(genre_name)
      @genres.push(genre)
    end
    game.genre = genre

    label = Label.new(label_title, label_color)
    game.label = label
    @labels.push(label)

    @games.push(game)
  end

  def list_games
    @games.each do |game|
      puts game.to_s
    end
  end
end

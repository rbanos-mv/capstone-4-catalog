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
    author = Author.new(author_first_name, author_last_name)
    game.author = author
    genre = Genre.new(genre_name)
    game.genre = genre
    label = Label.new(label_title, label_color)
    game.label = label
    @games.push(game)
    @authors.push(author)
    @genres.push(genre)
    @labels.push(label)
  end

  def list_games
    @games.each do |game|
      puts game.to_s
    end
  end
end

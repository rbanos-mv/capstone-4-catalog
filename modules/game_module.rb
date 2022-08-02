module GameModule
  # Team member 3

  def ask_game_data
    # implementation
  end

  def add_game
    # implementation
    title = string_input('Title of the game: ')
    publish_date = date_input('Publication date: ')
    last_played_at = date_input('Last played date: ')
    multiplayer = boolean_input('Is multiplayer? (y/n): ')
    game = Game.new(title, publish_date, last_played_at, multiplayer)
    author_first_name = string_input('Author First Name: ')
    author_last_name = string_input('Author Last Name: ')
    author = Author.new(author_first_name, author_last_name)
    game.author = author
    genre_name = string_input('Genre: ')
    genre = Genre.new(genre_name)
    game.genre = genre
    label_title = string_input('Label Title: ')
    label_color = string_input('Label color: ')
    label = Label.new(label_title, label_color)
    game.label = label
    game
  end

  def list_games
    # implementation
  end
end

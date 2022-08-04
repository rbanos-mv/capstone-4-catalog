require_relative './modules/input_module'
require_relative './classes/app'

class Main
  attr_reader :app

  def initialize
    @app = App.new
  end

  include InputModule

  def menu
    "
        M E N U

    1 - List all books
    2 - List all music albums
    3 - List of games
    4 - List all genres
    5 - List all labels
    6 - List all authors
    7 - Add a book
    8 - Add a music album
    9 - Add a game
   10 - Exit'
   Please choose an option by entering a number: "
  end

  def handle_menu_selection(user_input)
    case user_input
    when 1
      app.list_books
    when 2
      app.list_music_albums
    when 3
      app.list_games
    when 4
      app.list_genres
    when 5
      app.list_labels
    else
      handle_menu_selection_cont(user_input)
    end
  end

  def handle_menu_selection_cont(user_input)
    case user_input
    when 6
      app.list_authors
    when 7
      app.add_book
    when 8
      app.add_music_album
    when 9
      app.add_game
    else
      app.save_data
    end
  end

  def run
    user_input = nil

    puts 'Welcome to the catalog of my things'
    loop do
      user_input = numeric_input(menu, (1..10))
      handle_menu_selection(user_input)
      break if user_input == 10
    end
    puts "\nExiting the application..."
    sleep 1
  end
end

Main.new.run

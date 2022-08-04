require_relative '../classes/game'
require_relative '../classes/genre'
require_relative '../classes/author'
require_relative '../classes/label'

module GameModule
  # Team member 3

  def ask_game_data
    head = 'ADD NEW GAME'.center(50)
    puts "\n#{head}"
    [
      string_input('Title of the game: '),
      date_input('Publication date (yyyy-mm-dd): '),
      date_input('Last played date (yyyy-mm-dd): '),
      boolean_input('Is multiplayer? (y/n): ')
    ]
  end

  def add_game
    title, publish_date, last_played_at, multiplayer = ask_game_data
    game = Game.new(title, publish_date, last_played_at, multiplayer)

    game.author = add_author
    game.genre = add_genre
    game.label = add_label

    @games.push(game)
  end

  def list_games
    header, line = Game.header
    tname = 'ALL GAMES'.center(line.length)
    puts "\n#{tname}\n#{line}"

    if @games.empty?
      puts '*** EMPTY LIST ***'.center(line.length)
    else
      table = @games.map do |game|
        game
      end.join("\n")
      puts "#{header}\n#{line}\n#{table}"
    end
    puts line
  end
end

module GenreModule
  # Team member 2

  def ask_genre_data
    string_input('Genre name: ')
  end

  def add_genre
    genre_name = ask_genre_data
    @genres << Genre.new(genre_name)
  end

  def select_genre
    loop do
      prompt = "    0) Add Genre\n#{genres_list}\nSelect a Genre from the list: "
      option = numeric_input(prompt, (-1..@genres.length))
      return option - 1 unless option.zero?

      add_genre
    end
  end

  def genres_list
    @genres.map.with_index do |genre, index|
      index_str = (index + 1).to_s.rjust(5)
      "#{index_str}) #{genre.to_s(full: false)}\n"
    end.join
  end

  def list_genres
    header, line = Genre.header(empty: @genres.empty?)
    if @genres.empty?
      puts header
    else
      list = @genres.map do |genre|
        genre
      end.join("\n")
      puts "#{header}\n#{list}\n#{line}"
    end
  end
end

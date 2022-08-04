module AuthorModule
  # Team member 3

  def ask_author_data
    [
      string_input('Author First Name: ').capitalize,
      string_input('Author Last Name: ').capitalize
    ]
  end

  def add_author
    first_name, last_name = ask_author_data
    @authors.find(lambda {
      @authors << Author.new(first_name, last_name)
      @authors.last
    }) { |author| author.first_name == first_name && author.last_name == last_name }
  end

  def list_authors
    header, line = Author.header
    tname = 'ALL AUTHORS'.center(line.length)
    puts "\n#{tname}\n#{line}"

    if @authors.empty?
      puts '*** EMPTY LIST ***'.center(line.length)
    else
      table = @authors.map do |author|
        author
      end.join("\n")
      puts "#{header}\n#{line}\n#{table}"
    end
    puts line
  end
end

require './classes/book'
require './classes/label'
require 'date'

module BookModule
  # Team member 1

  def ask_book_data
    head = 'ADD NEW BOOK'.center(50)
    puts "\n#{head}"
    [
      string_input('Title: ').capitalize,
      date_input('Date of publication [yyyy-mm-dd]: '),
      string_input('Publisher: ').capitalize,
      letter_input("Cover state (Enter 'good' or 'bad'): ", %w[GOOD BAD]).downcase
    ]
  end

  def add_book
    title, published_date, publisher, cover_state = ask_book_data
    new_book = Book.new(title, published_date, publisher, cover_state)

    new_book.label = add_label

    @books.push(new_book)
  end

  def list_books
    header, line = Book.header
    tname = 'ALL BOOKS'.center(line.length)
    puts "\n#{tname}\n#{line}"

    if @books.empty?
      puts '*** EMPTY LIST ***'.center(line.length)
    else
      table = @books.map do |book|
        book
      end.join("\n")
      puts "#{header}\n#{line}\n#{table}"
    end
    puts line
  end
end

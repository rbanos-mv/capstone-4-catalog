require './classes/book'
require './classes/label'
require 'date'

module BookModule
  # Team member 1

  def ask_book_data
    # implementation
  end

  def add_book
    # implementation
    puts "\nAdd a book"
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    published_date = date_input('Date of publication [yyyy-mm-dd]: ')
    print 'Publisher: '
    publisher = gets.chomp
    cover_state = letter_input("Cover state (Enter 'good' or 'bad'): ", %w[GOOD BAD]).downcase
    new_label = Label.new(title, color)
    new_book = Book.new(title, published_date, publisher, cover_state)
    new_book.label = new_label
    @books.push(new_book)
    @labels.push(new_label)
  end

  def list_books
    # implementation
    puts "\nAll books"

    if @books.length.zero?
      puts 'Book list is empty. Choose option (7) to add a book'
    else
      @books.map do |book|
        puts "Publication Date: #{book.publish_date}, Publisher: #{book.publisher}, \
State: #{book.cover_state}"
      end
    end
  end
end

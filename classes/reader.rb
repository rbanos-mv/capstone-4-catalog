require 'json'
require './classes/book'
require './classes/label'

class Reader
  def initialize(books, labels)
    @books_file = File.open('books.json', 'r')
    @labels_file = File.open('labels.json', 'r')
    @books_local = []
    @labels_local = []
    @books = books
    @labels = labels
  end

  def read
    @books_file.each { |line| @books_local << JSON.parse(line) }
    @books_file.close
    create_books
    @labels_file.each { |line| @labels_local << JSON.parse(line) }
    @labels_file.close
    create_labels
  end

  private

  def create_books
    @books_local.each do |book|
      @books << Book.new(book[0], Date.parse(book[1]), book[2], book[3])
    end
  end

  def create_labels
    @labels_local.each do |label|
      @labels << Label.new(label[0], label[1])
    end
  end
end

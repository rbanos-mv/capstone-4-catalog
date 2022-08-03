require 'json'
require './classes/book'
require './classes/label'


class Reader
    def initialize(books, labels)
        @books_file = File.open('books.json', 'r')
        @labels_file = File.open('labels.json', 'r')
        @booksLocal = []
        @labelsLocal = []
        @books = books
        @labels = labels
      end

      def read
        @books_file.each { |line| @booksLocal << JSON.parse(line) }
        @books_file.close
        create_books
        @labels_file.each { |line| @labelsLocal << JSON.parse(line) }
        @labels_file.close
        create_labels
      end

      private

      def create_books
        @booksLocal.each do |book|
          @books << Book.new(book[0], Date.parse(book[1]), book[2], book[3])
        end
      end

      def create_labels
        @labelsLocal.each do |label|
          @labels << Label.new(label[0], label[1])
        end
      end
end
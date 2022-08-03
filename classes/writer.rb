require 'json'

class Writer
    def initialize()
        @books_file = if File.exist?('books.json')
                         File.open('books.json', 'a')
                       else
                         File.open('books.json', 'w')
                       end
        @labels_file = if File.exist?('labels.json')
                        File.open('labels.json', 'a')
                      else
                        File.open('labels.json', 'w')
                      end
      end
      def books(title:, published_date:, publisher:, cover_state:)
        object = [title, published_date, publisher, cover_state]
        @books_file.write("#{JSON.generate(object)}\n")
      end

      def labels(title:, color:)
        object = [title, color]
        @labels_file.write("#{JSON.generate(object)}\n")
      end

      def close_all
        @books_file.close
        @labels_file.close
      end
end
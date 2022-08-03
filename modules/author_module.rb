module AuthorModule
  # Team member 3

  def ask_author_data
    # implementation
  end

  def add_author
    # implementation
  end

  def list_authors
    @authors.each do |author|
      puts author.to_s
    end
  end
end

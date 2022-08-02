module LabelModule
  # Team member 1

  def ask_label_data
    # implementation
  end

  def add_label
    # implementation
  end

  def list_labels
    # implementation
    puts "\nAll Labels"

    if @labels.length.zero?
      puts 'No labels found. Choose option (7) to add a book with label'
    else
      @labels.map do |label|
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end
end

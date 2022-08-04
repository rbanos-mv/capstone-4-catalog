module LabelModule
  # Team member 1

  def ask_label_data
    [
      string_input('Label title: ').capitalize,
      string_input('Label color: ').capitalize
    ]
  end

  def add_label
    title, color = ask_label_data
    @labels.find(lambda {
      @labels << Label.new(title, color)
      @labels.last
    }) { |label| label.title == title && label.color == color }
  end

  def list_labels
    header, line = Label.header
    tname = 'ALL LABELS'.center(line.length)
    puts "\n#{tname}\n#{line}"

    if @labels.empty?
      puts '*** EMPTY LIST ***'.center(line.length)
    else
      table = @labels.map do |label|
        label
      end.join("\n")
      puts "#{header}\n#{line}\n#{table}"
    end
    puts line
  end
end

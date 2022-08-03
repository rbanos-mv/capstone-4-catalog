require 'date'

module InputModule
  def string_input(prompt)
    print prompt
    gets.chomp.squeeze(' ').strip
  end

  def date_input(prompt)
    loop do
      input = string_input(prompt)
      date = Date.parse(input)
    rescue Date::Error
      puts 'Invalid date'
    else
      return date
    end
  end

  def letter_input(prompt, valid_options)
    loop do
      input = string_input(prompt).upcase
      return input if valid_options.include?(input)
    end
  end

  def numeric_input(prompt, valid_options)
    loop do
      input = string_input(prompt).to_i
      return input if valid_options.include?(input)
    end
  end

  def boolean_input(prompt)
    loop do
      input = string_input(prompt)
      return false if %w[false False 0 FALSE N n].include?(input)
      return true if %w[true True 1 TRUE Y y].include?(input)
    end
  end
end

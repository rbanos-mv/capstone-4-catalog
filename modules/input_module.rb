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
end

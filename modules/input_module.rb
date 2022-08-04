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
    false_options = %w[0 F FALSE N NO]
    true_options = %w[1 T TRUE Y YES]
    input = letter_input(prompt, false_options + true_options)
    true_options.include?(input)
  end
end

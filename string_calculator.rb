# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    # Return 0 for empty strings
    return 0 if numbers.empty?

    # Check for invalid input where a number ends with a comma followed by a newline
    raise 'input is invalid' if numbers.match?(/,\n|\n,/)

    # Check and set custom delimiter if present, otherwise use default delimiters comma and newline
    if numbers.start_with?('//')
      delimiter, numbers = parse_custom_delimiter(numbers)
    else
      delimiter = /[,|\n]/
    end
  end

  private

  def parse_custom_delimiter(numbers)
    parts = numbers.split("\n", 2) # Split only on first newline
    custom_delimiter = parts[0][2..]
    numbers = parts[1]

    # Allow multiple single char or one longer custom delimiter
    custom_delimiter = Regexp.escape(custom_delimiter)
    pattern = custom_delimiter.include?('[') ? parse_multiple_delimiters(custom_delimiter) : custom_delimiter

    [pattern, numbers]
  end

  def parse_multiple_delimiters(custom_delimiter)
    delimiters = custom_delimiter.scan(/\[([^\[\]]+)\]/).flatten.map { |delim| Regexp.escape(delim) }
    Regexp.union(delimiters)
  end
end
  
# Example usage:
# calculator = StringCalculator.new
# puts calculator.add('')          # Should output 0
# puts calculator.add("1,\n")    # Uncommenting this line would raise the 'input is invalid' exception
# puts calculator.add("1\n2,3")    # Should output 6
# puts calculator.add("//;\n1;2")  # Should output 3
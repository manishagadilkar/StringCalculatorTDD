# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    # Return 0 for empty strings
    return 0 if numbers.empty?
  end
end
  
# Example usage:
# calculator = StringCalculator.new
# puts calculator.add('')          # Should output 0
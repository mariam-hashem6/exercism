class Luhn
  def self.valid?(input)
    cleaned_input = input.gsub(/\s/, '')
    return false if cleaned_input.length <= 1
    return false unless cleaned_input.match?(/^\d+$/)
    digits = cleaned_input.chars.map(&:to_i).reverse
    processed_digits = digits.map.with_index do |digit, index|
      if index.odd?
        doubled = digit * 2
        doubled > 9 ? doubled - 9 : doubled
      else
        digit
      end
    end
    processed_digits.sum % 10 == 0
  end
end
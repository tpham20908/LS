DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}.freeze

def string_to_integer(str)
  digits = str.chars.map { |char| DIGITS[char] }
  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

# def string_to_signed_integer(str)
#   if DIGITS.keys.include?(str[0])
#     string_to_integer(str)
#   elsif str[0] == '-'
#     -string_to_integer(str[1..-1])
#   elsif str[0] == '+'
#     string_to_integer(str[1..-1])
#   end
# end

# Solution

def string_to_signed_integer(str)
  str = '+' + str if DIGITS.keys.include?(str[0])
  case str[0]
  when '-'
    -string_to_integer(str[1..-1])
  when '+'
    string_to_integer(str[1..-1])
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100

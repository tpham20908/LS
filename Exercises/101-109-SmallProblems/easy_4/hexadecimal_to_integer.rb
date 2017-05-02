DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
}

def hexadecimal_to_integer(str)
  digits = str.chars.map { |char| DIGITS[char.downcase] }
  value = 0
  digits.each { |digit| value = 16 * value + digit }
  value
end

puts hexadecimal_to_integer('23') == 35
puts hexadecimal_to_integer('14') == 20
puts hexadecimal_to_integer('abc') == 2748
puts hexadecimal_to_integer('4D9f') == 19871

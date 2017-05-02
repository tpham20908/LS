# def string_to_integer(str)
#   hsh = {
#     '1' => 1,
#     '2' => 2,
#     '3' => 3,
#     '4' => 4,
#     '5' => 5,
#     '6' => 6,
#     '7' => 7,
#     '8' => 8,
#     '9' => 9,
#     '0' => 0
#   }
#   new_str = str.chars.map { |char| hsh[char] }

#   sum = 0
#   count = 0
#   loop do
#     break if count == new_str.size
#     new_str.reverse.each do |number|
#       sum += number * (10 ** count)
#       count += 1
#     end
#   end
#   sum
# end

# Solution

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(str)
  digits = str.chars.map { |char| DIGITS[char] }
  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
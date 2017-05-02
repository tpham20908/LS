# def integer_to_string(number)
#   str_arr = []
#   loop do
#     number, mod = number.divmod(10)
#     str_arr.unshift(mod)
#     break if number == 0
#   end
#   str_arr.join
# end

# Solution

DIGITS = %w(0 1 2 3 4 5 6 7 8 9).freeze
def integer_to_string(number)
  str = ''
  loop do
    number, remainder = number.divmod(10)
    str.prepend(DIGITS[remainder])
    break if number.zero?
  end
  str
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

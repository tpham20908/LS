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

def signed_integer_to_string(number)
  if number * -1 > 0
    integer_to_string(number * -1).prepend('-')
  elsif number * -1 < 0
    integer_to_string(number).prepend('+')
  else
    integer_to_string(number)
  end
end

# Solution

# def signed_integer_to_string(number)
#   case number <=> 0
#   when -1
#     "-#{integer_to_string(-number)}"
#   when 1
#     "+#{integer_to_string(number)}"
#   else
#     "#{integer_to_string(number)}"
#   end
# end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'

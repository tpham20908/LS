def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)

  # number_str_arr = number.to_s.split('')
  # total = 0
  # number_str_arr.each { |ele| total += ele.to_i }
  # total
end

# puts sum(23)
# puts sum(496)
# puts sum(123_456_789)

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
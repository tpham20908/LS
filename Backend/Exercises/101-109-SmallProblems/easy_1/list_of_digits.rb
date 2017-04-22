def digit_list(number)
  digits = []
  while number > 0
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
  end
  digits
end

# def digit_list(number)
#   number.to_s.chars.map(&:to_i)
# end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]
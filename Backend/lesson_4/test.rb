def multiply(numbers, multiplier)
  count = 0
  multiply_numbers = []
  loop do
    break if count == numbers.size
    multiply_numbers << (numbers[count] *= multiplier).round(4)
    count += 1
  end
  multiply_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 312.768) # => [3, 12, 9, 21, 6, 18]
def average(arr)
  total = 0
  arr.each { |element| total += element }
  total / arr.size
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
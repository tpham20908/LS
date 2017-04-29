def oddities(arr)
  new_arr = []
  # arr.each_with_index do |element, index|
  #   if index.even?
  #     new_arr << element
  #   end

  arr.select do |element|
  new_arr << element if arr.index(element).even?
  end
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
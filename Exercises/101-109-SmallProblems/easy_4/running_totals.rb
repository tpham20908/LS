# def running_total(arr)
#   running_total_arr = Array.new()
#   index = 1
#   loop do
#     break if index > arr.size
#     running_total_arr << arr[0, index].inject(&:+)
#     index += 1
#   end
#   running_total_arr
# end

# Solution

def running_total(arr)
  sum = 0
  # arr.map { |value| sum += value }
  arr.each_with_object([]) do |value, new_arr|
    new_arr << sum += value
  end
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
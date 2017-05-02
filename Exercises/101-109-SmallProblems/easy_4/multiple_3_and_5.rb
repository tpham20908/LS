# def multisum(number)
#   multisum_arr = []
#   quotient_at_3 = number / 3
#   quotient_at_5 = number / 5
#   add_to_arr(quotient_at_3, 3, multisum_arr)
#   add_to_arr(quotient_at_5, 5, multisum_arr)

#   multisum_arr.uniq.inject(&:+)
# end

# def add_to_arr(number, multiply, arr)
#   (1..number).each do |ele|
#     arr << ele * multiply
#   end
#   arr
# end

# Solution

def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(max_value)
  sum = []
  1.upto(max_value) do |number|
    if multiple?(number, 3) || multiple?(number, 5)
      sum << number
    end
  end
  sum.reduce(&:+)
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(20) == 98
puts multisum(1000) == 234168

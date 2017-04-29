def multiply(n1, n2)
  n1 * n2
end

def square(n)
  multiply(n, n)
end

# puts square(5)
# puts square(-8)

def power(number, pow)
  if pow == 0
    1
  elsif pow > 0
    multiply(number, power(number, pow - 1))
  else
    pow = pow.abs
    denominator = multiply(number, power(number, pow - 1))
    result = 1.0 / denominator
    format('%02.3f', result)
  end
end

puts power(3, 4) # => 81
puts power(4, 3) # => 64
puts power(2, -3) # => 0.000 (supposed to be 0.125)
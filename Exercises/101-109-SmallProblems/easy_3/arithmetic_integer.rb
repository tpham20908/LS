def addition(num1, num2)
  addition = num1 + num2
  puts "#{num1} + #{num2} = #{format('%02.2f', addition)}"
end

def subtraction(num1, num2)
  subtraction = num1 - num2
  puts "#{num1} - #{num2} = #{format('%02.2f', subtraction)}"
end

def product(num1, num2)
  product = num1 * num2
  puts "#{num1} * #{num2} = #{format('%02.2f', product)}"
end

def quotient(num1, num2)
  quotient = num1 / num2
  puts "#{num1} / #{num2} = #{format('%02.2f', quotient)}"
end

def remainder(num1, num2)
  remainder = num1 % num2
  puts "#{num1} % #{num2} = #{format('%02.2f', remainder)}"
end

def power(num1, num2)
  power = num1 ** num2
  puts "#{num1} ** #{num2} = #{format('%02.2f', power)}"
end

puts "Enter the first number: "
first = gets().to_f

second = 0
until second != 0
  puts "Enter the second number (must not be zero): "
  second = gets().to_f
end

addition(first, second)
subtraction(first, second)
product(first, second)
quotient(first, second)
remainder(first, second)
power(first, second)


# Solution

# def prompt(message)
#   puts "==> #{message}"
# end

# prompt("Enter the first number:")
# first_number = gets.chomp.to_i
# prompt("Enter the second number:")
# second_number = gets.chomp.to_i

# prompt("#{first_number} + #{second_number} = #{first_number + second_number}")
# prompt("#{first_number} - #{second_number} = #{first_number - second_number}")
# prompt("#{first_number} * #{second_number} = #{first_number * second_number}")
# prompt("#{first_number} / #{second_number} = #{first_number / second_number}")
# prompt("#{first_number} % #{second_number} = #{first_number % second_number}")
# prompt("#{first_number} ** #{second_number} = #{first_number**second_number}")
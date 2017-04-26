def compute_sum(number)
  # total = 0
  # (1..number).each do |element|
  #   total += element
  # end
  # total
  (1..number).inject(:+)
end

def compute_product(number)
  # product = 1
  # (1..number).each do |element|
  #   product *= element
  # end
  # product
  (1..number).reduce(:*)
end

def get_number
  number = nil
  loop do
    puts "Please enter an integer greater than 0: "
    number = gets().chomp()
    if number.to_i.to_s == number
      break
    else
      puts "Hmmm...That doesn't seem like a valid integer."
    end
  end
  number.to_i
end

def get_operation
  operation = nil
  loop do
    puts "Enter 's' to compute the sum, 'p' to compute the product."
    operation = gets().chomp()
    if %w(s p).include?(operation)
      break
    else
      puts "Do not understand that operation."
    end
  end
  operation
end

number = get_number
operation = get_operation

if operation == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
else
  product = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
end
def display(number)
  if number == 1
    number = "1st"
  elsif number == 2
    number = "2nd"
  elsif number == 3
    number = "3rd"
  else
    number = number.to_s + "th"
  end
end

def get_numbers(size)
  numbers = []
  size.times do |count|
    display_count = display(count + 1)
    element = nil
    loop do
      puts "Enter your #{display_count} numbers: "
      element = gets().chomp()
      if element.to_i.to_s == element
        numbers << element.to_i
        break
      else
        puts "Enter an integer, please!"
      end
    end
  end
  numbers
end

def last_number_appears?(arr)
  last_number = arr.last()
  new_arr = arr.first(arr.size - 1)
  if new_arr.include?(last_number)
    puts "==> The number #{last_number} appears in #{new_arr}."
  else
    puts "==> The number #{last_number} does not appears in #{new_arr}."
  end
end

numbers = get_numbers(6)
last_number_appears?(numbers)


# Solution

# numbers = []

# puts "Enter the 1st number:"
# numbers << gets.chomp.to_i
# puts "Enter the 2nd number:"
# numbers << gets.chomp.to_i
# puts "Enter the 3rd number:"
# numbers << gets.chomp.to_i
# puts "Enter the 4th number:"
# numbers << gets.chomp.to_i
# puts "Enter the 5th number:"
# numbers << gets.chomp.to_i
# puts "Enter the last number:"
# last_number = gets.chomp.to_i

# if numbers.include? last_number
#   puts "The number #{last_number} appears in #{numbers}."
# else
#   puts "The number #{last_number} does not appear in #{numbers}."
# end
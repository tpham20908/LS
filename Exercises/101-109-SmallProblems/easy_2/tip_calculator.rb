puts 'What is the bill? '
bill = gets().chomp().to_f

puts 'What is the percentage? '
percentage = gets().chomp().to_f

tip = bill * percentage / 100
total = bill + tip

puts "The tip is: $#{format('%02.2f', tip)}"
puts "The total is: $#{format('%02.2f', total)}"

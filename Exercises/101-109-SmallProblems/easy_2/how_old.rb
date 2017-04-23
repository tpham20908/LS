puts "What is your name?"
name = gets().chomp()

if name == '' then name = "teddy" end

puts "#{name.capitalize} is #{rand(20..200)} years old"

# str = ''
# until !str.empty?
#   puts "Please write word or multiple words: "
#   str = gets().chomp()
# end
# words = str.split()
# length_of_str = 0
# words.each { |word| length_of_str += word.size }

# puts "There are #{length_of_str} characters in \"#{str}\"."

puts "Please write word or multiple words: "
str = gets().chomp()
new_str = str.delete(' ')
puts "There are #{new_str.size} characters in the \"#{str}\"."
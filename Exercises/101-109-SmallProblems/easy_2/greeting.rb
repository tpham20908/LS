puts 'What is your name? '
name = gets().chomp()

if name.chars.last() == '!'
  name = name.chop
  puts ("hello #{name}. why are we screaming?").upcase()
else
  puts "Hello #{name.capitalize}."
end

# Solution
# print 'What is your name? '
# name = gets.chomp

# if name[-1] == '!'
#   name = name.chop
#   puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end
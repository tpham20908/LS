def palindrome?(str)
  first_str = str[0, str.size / 2]
  second_str = str.reverse[0, str.size / 2]
  first_str == second_str
end

# Solution
# def palindrome?(string)
#   string == string.reverse
# end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
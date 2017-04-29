def palindrome?(str)
  first_str = str[0, str.size / 2]
  second_str = str.reverse[0, str.size / 2]
  first_str == second_str
end

# def real_palindrome?(string)
#   alphanumerics = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a
#   new_string = ''
#   string.split('').each do |char|
#     new_string << char if alphanumerics.include?(char)
#   end
#   palindrome?(new_string.downcase)
# end

# Solution
def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false

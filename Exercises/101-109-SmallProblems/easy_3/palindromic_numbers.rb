def palindrome?(str)
  first_str = str[0, str.size / 2]
  second_str = str.reverse[0, str.size / 2]
  first_str == second_str
end

def palindromic_number?(number)
  palindrome?(number.to_s)
end

puts palindromic_number?(0345430) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
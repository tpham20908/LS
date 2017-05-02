def short_long_short(str1, str2)
  # if str1.size <= str2.size
  #   str1 + str2 + str1
  # else
  #   str2 + str1 + str2
  # end

  # str1.size > str2.size ? str2 + str1 + str2 : str1 + str2 + str1

  arr = [str1, str2].sort_by(&:length)
  arr.first + arr.last + arr.first
end

puts short_long_short('abc', 'defgh') == 'abcdefghabc'
puts short_long_short('abcde', 'fgh') == 'fghabcdefgh'
puts short_long_short('', 'xyz') == 'xyz'

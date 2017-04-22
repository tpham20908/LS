def reverse_words(string)
  words = string.split
  new_string = []
  words.each do |word|
    word.reverse! if word.size >= 5
    new_string << word
  end
  new_string.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
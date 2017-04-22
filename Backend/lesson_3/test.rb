# def is_an_ip_number?(word)
#   /^\d+$/.match(word)
# end

def dot_separated_ip_address?(input_string)
  if /^\d+\.\d+\.\d+\.\d+$/.match(input_string)
    true
  else
    false
  end
  # dot_separated_words = input_string.split(".")

  # if dot_separated_words.count != 4
  #   return false
  # else
  #   while dot_separated_words.size > 0 do
  #     word = dot_separated_words.pop
  #     return false unless is_an_ip_number?(word)
  #   end
  # end

  # true
  # return false unless dot_separated_words.count == 4

  # while dot_separated_words.size > 0 do
  #   word = dot_separated_words.pop
  #   return false unless is_an_ip_number?(word)
  # end

  # return true
end

ip1 = "109.09.10.23"
ip2 = "200.109.09.10.23"
ip3 = "09.10.23.12"
ip4 = "09.10.23.hi"
ip5 = "09.10.23"

puts dot_separated_ip_address?(ip1)   # => true
puts dot_separated_ip_address?(ip2)   # => false
puts dot_separated_ip_address?(ip3)   # => true
puts dot_separated_ip_address?(ip4)   # => false
puts dot_separated_ip_address?(ip5)   # => false
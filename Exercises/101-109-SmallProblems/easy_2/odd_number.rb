# count = 1

# loop do
#   break if count > 99
#   puts count if count.odd?
#   count += 1
# end

# 1.upto(99) do |number|
#   puts number if number % 2 == 1
# end

puts (1..99).select { |number| number.odd? }

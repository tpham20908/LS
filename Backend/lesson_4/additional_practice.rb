# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# hsh = Hash.new()
# flintstones.each_with_index do |name, index|
#   hsh[name] = index
# end
# puts hsh


# Calculate the total of ages
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# # ages_arr = ages.values
# # sum_ages = 0
# # ages_arr.each { |age| sum_ages += age }
# # puts sum_ages
# or
# puts ages.values.inject(:+)


# Throw out the age which are >= 100
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# ages.select! do |_, value|
#   value < 100
# end

# # or
# # ages.keep_if { |_, value| value < 100 }

# puts ages


# Pick out the minimum age
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# puts ages.values.min

# Find the index of the first name that starts with "Be"
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# words = flintstones.select do |word|
#   /Be/.match(word)
# end
#
# or
# words = flintstones.select do |word|
#   word[0, 2] == 'Be'
# end
# puts words


# Amend this array so that the names are all shortened to just the first three characters:
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# new_flintstones = flintstones.map! do |name|
#   name[0, 3]
# end
# puts new_flintstones

# Create a hash that expresses the frequency with which each letter occurs in this string:
# statement = "The Flintstones Rock"
# new_statement = statement.delete(' ').split('')
# statement_hash = {}
# new_statement.each_with_index do |char, idx|
#   statement_hash[char] = new_statement.count(char)
# end
# puts statement_hash

# Solution
# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a
# letters.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   result[letter] = letter_frequency if letter_frequency > 0
# end
# puts result


# What happens when we modify an array while we are iterating over it? What would be output by this code?
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

# What would be output by this code?
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# def titleize(str)
#   str.split.map { |word| word.capitalize! }.join(' ')
# end

# words = "the flintstones rock"
# puts titleize(words)


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.values.each do |element|
  case element["age"]
  when 0..17
    element["age_group"] = "kid"
  when 18..64
    element["age_group"] = "adult"
  else
    element["age_group"] = "senior"
  end
end

puts munsters




# Using the each method, write some code to output all of the vowels from the strings.

hsh = {
  first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog']
}

hsh.values.flatten.each do |word|
  word.chars.each { |char| puts char if 'aeiou'.include?(char) }
end
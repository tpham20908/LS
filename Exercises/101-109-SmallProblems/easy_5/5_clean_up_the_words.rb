def cleanup(str)
  # str.gsub(/[^a-zA-Z]/, ' ').squeeze(' ')
  # str.gsub(/[^a-z]/i, ' ').squeeze(' ')
  chars_list = ('a'..'z').to_a + ('A'..'Z').to_a
  str.split('').map do |char|
    if !chars_list.include?(char)
      char = ' '
    else
      char
    end
    puts char
  end
  puts str
end

cleanup("---What's my +*& line?") #== ' What s my line '
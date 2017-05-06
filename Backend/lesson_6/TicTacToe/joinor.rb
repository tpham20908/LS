# def joinor(num_arr, str1 = ', ', str2 = 'or')
#   str_arr = num_arr.map(&:to_s)
#   str_arr.last.prepend(str2 + ' ')

#   if str_arr.size > 2
#     str_arr[0..-2].each do |element|
#       element.concat(str1)
#     end
#   else
#     str_arr.first.concat(' ')
#   end

#   str_arr.join
# end

def joinor(arr, str1 = ', ', str2 = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{str2} ")
  else
    arr[-1] = "#{str2} #{arr.last}"
    arr.join(str1)
  end
end

p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
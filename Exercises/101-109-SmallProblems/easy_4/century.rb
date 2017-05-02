# def display(number)
#   last_two = format('%02d', number).to_s.chars[-2, 2].join
#   number_message = ''
#   if ['11', '12', '13'].include?(last_two)
#     number_message =  case last_two
#                       when '11'
#                       number.to_s + 'th'
#                       when '12'
#                       number.to_s + 'th'
#                       when '13'
#                       number.to_s + 'th'
#                       end
#   else
#     number_message =  case last_two.chars.last
#                       when '1'
#                         number.to_s + 'st'
#                       when '2'
#                         number.to_s + 'nd'
#                       when '3'
#                         number.to_s + 'rd'
#                       else
#                         number.to_s + 'th'
#                       end
#   end
#   number_message
# end

# def century(year)
#   year % 100 == 0 ? century = year / 100 : century = year / 100 + 1

#   display(century)
# end

# Solution

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

puts century(2000) #== '20th'
puts century(2001) #== '21st'
puts century(1965) #== '20th'
puts century(256) #== '3rd'
puts century(5) #== '1st'
puts century(10103) #== '102nd'
puts century(1052) #== '11th'
puts century(1127) #== '12th'
puts century(11201) #== '113th'
puts century(11200) #== '112th'
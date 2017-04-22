def stringy(size)
  str = []
  count = 1
  while count <= size
    str << count % 2
    count += 1
  end

  # size.times do |index|
  #   number = index.even? ? 1 : 0
  #   str << number
  # end

  str.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

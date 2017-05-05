VALID_HEXA = ('0'..'9').to_a + ('a'..'f').to_a

def uuid
  uuid = ''
  uuid_pattern = [8, 4, 4, 4, 12]
  uuid_pattern.each_with_index do |number, idx|
    number.times { uuid << VALID_HEXA.sample() }
    uuid << '-' unless idx >= uuid_pattern.size - 1
  end
  uuid
end

puts uuid
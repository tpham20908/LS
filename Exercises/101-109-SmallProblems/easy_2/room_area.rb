CONVERSION = {
  "meters"      => 1,
  "feet"        => 3.28084,
  "inches"      => 39.3701,
  "centimeters" => 100
}

SQMETERS_TO_SQFEET = CONVERSION["feet"] ** 2
SQFEET_TO_INCHES = (CONVERSION["inches"] / CONVERSION["feet"]) ** 2
SQFEET_TO_CENTIMETERS = (CONVERSION["centimeters"] / CONVERSION["feet"]) ** 2

def get_unit
  unit = nil
  loop do
    puts "Enter the unit to calculate: "
    unit = gets().chomp()
    break if CONVERSION.keys.include?(unit)
  end
  unit
end

def get_length(unit)
  length = nil
  loop do
    puts "Enter the length of the room in #{unit}: "
    length = gets().chomp()
    if /^\d+\.?\d*$/.match(length)
      break
    else
      puts 'Hmmm...that doesn\'t seem like a valid input'
    end
  end
  length
end

def get_width(unit)
  width = nil
  loop do
    puts "Enter the width of the room in #{unit}: "
    width = gets().chomp()
    if /^\d+\.?\d*$/.match(width)
      break
    else
      puts 'Hmmm...that doesn\'t seem like a valid input'
    end
  end
  width
end

unit = get_unit
length = get_length(unit).to_f
width = get_width(unit).to_f
area_in_feet = length * width
area_in_inches = area_in_feet * SQFEET_TO_INCHES
area_in_centimeters = area_in_feet * SQFEET_TO_CENTIMETERS

puts "The area of the room is #{format('%02.1f', area_in_feet)} " + \
      "square feet (#{format('%02.2f', area_in_inches)} square inches, " + \
      "#{format('%02.2f', area_in_centimeters)} square centimeters)."


# Solution

# SQMETERS_TO_SQFEET = 10.7639

# puts '==> Enter the length of the room in meters: '
# length = gets.to_f

# puts '==> Enter the width of the room in meters: '
# width = gets.to_f

# square_meters = (length * width).round(2)
# square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)

# puts "The area of the room is #{square_meters} " + \
#      "square meters (#{square_feet} square feet)."
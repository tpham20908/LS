def count_occurrences(array)
  list = {}
  array.each do |vehicle|
    list[vehicle] = array.count(vehicle)
  end

  list.each do |type, quantity|
    puts "#{type} => #{quantity}"
  end
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
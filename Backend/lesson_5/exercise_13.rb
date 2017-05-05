# Given the following data structure, return a new array containing
# the same sub-arrays as the original but ordered logically according
# to the numeric value of the odd integers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

new_arr = arr.sort_by do |sub_arrays|
  sub_arrays.select { |number| number.odd? }
end

p new_arr
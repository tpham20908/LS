arr1 = [1, [2, 3], 4]
puts arr1[1][1]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
puts arr2[2]

hsh1 = {first: [1, 2, [3]]}
puts hsh1[:first][2][0]

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
puts hsh2[['a']][:a][2]
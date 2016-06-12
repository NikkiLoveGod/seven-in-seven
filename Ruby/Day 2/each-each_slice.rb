puts "# Print contents of array with 16 numbers, 4 at a time with each only"
array_of_16_values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]

array_of_16_values.each do |i|
  puts "#{array_of_16_values.slice!(0..3)}"
end

puts "# With each_slice in Enumerator"
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16].each_slice(4) do |items|
  puts "#{items}"
end


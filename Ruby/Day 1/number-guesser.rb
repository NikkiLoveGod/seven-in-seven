rightNumber = rand(10)

puts "Guess the number between 0 and 10!"

while (guess = gets.to_i) != rightNumber
  puts "Too low :(" if guess < rightNumber
  puts "Too high :(" if guess > rightNumber
end

puts "Correct!"
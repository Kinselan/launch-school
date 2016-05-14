def factors(number)
 # if number <= 0
#    puts "Invalid input, please enter a positive number"
#    break
 # end

  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

puts "Factor what number?"
number_to_factor = gets.chomp.to_i
p factors(number_to_factor)
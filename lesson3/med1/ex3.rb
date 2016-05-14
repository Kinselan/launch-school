# The result of the following statement will be an error:
# puts "the value of 40 + 2 is " + (40 + 2)

# this is because 40+2 returns fixnum, but string + is expecting a string

# fix 1
puts "the value of 40 + 2 is " + (40 + 2).to_s

# fix 2

puts "the value of 40 + 2 is #{40 + 2}"
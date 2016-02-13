
# print 1, shift(remove 2), print 3, shift(remove 4)
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# print 1, pop 4, print 2, pop 3
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
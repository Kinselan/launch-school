# joinor([1, 2, 3])                # => "1, 2, or 3"
# joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

require 'pry'

def joinor(arr, delim = ', ', lastword = 'or')
  ending =  "#{delim}#{lastword} " + arr.pop.to_s
  result = ''
  result = arr.join(delim) + ending
  p result
end

system 'clear'
joinor([1, 2, 3])
joinor([1, 2, 3], '; ')
joinor([1, 2, 3], ', ', 'and')
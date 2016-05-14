# Each UUID consists of 32 hexadecimal characters, and is typically broken
# into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.


def uuid_method()
  hex=["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
  uuid = ""

  8.times { uuid += hex[rand(0..15)] }
  uuid += "-"

  3.times do
   4.times { uuid += hex[rand(0..15)] }
   uuid += "-"
  end

  12.times { uuid += hex[rand(0..15)] }
  return uuid
end

p uuid_method()

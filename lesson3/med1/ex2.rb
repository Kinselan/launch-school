# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

# create 'word_frequency' hash
# transform statement into 'letters' array of separate characters
# iterate through array, if letter is a key in hash, increment it's value
# -->  if word is not in hash, add it to hash with counter = 1


word_frequency = {}
letters = statement.chars

letters.each do |letter|
  if word_frequency.has_key?(letter)
    word_frequency[letter] += 1
  else
    word_frequency[letter] = 1
  end
end

puts word_frequency
# i could also downcase everything so 'T' is the same as 't', but inx
# didn't specifically say to do that



# ls
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
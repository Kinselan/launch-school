# method 1
famous_words = "seven years ago..."
famous_words.insert(0, 'Four score and ')
puts famous_words

# method 2
famous_words = "seven years ago..."
famous_words = 'Four score and ' + famous_words
puts famous_words

# launch school solution
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
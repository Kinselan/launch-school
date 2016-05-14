# break string into array of words
# capitalize each element of array (each word)
# re-join the array


def titelize(string)
  words = string.split(' ')

  words.each do |word|
    word.capitalize!
  end
  words.join(" ")
end


p titelize("hello there mr san fran cisco")


# ls
words.split.map { |word| word.capitalize }.join(' ')

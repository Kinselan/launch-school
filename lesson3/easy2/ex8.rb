# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# each word .start_with?("Be")

# flintstones.each_with do |word|
#   if word.start_with?("Be")
#     p word
#   end
# end


p flintstones.index { |person| person.start_with?("Be") }

# ls
flintstones.index { |name| name[0, 2] == "Be" }
advice = "Few things in life are as important as house training your pet dinosaur."

arr = advice.split(' ')

new_sentence = ''
arr.each do |word| 
    result = word
    if word == 'important'
        result = 'urgent'
    end
    new_sentence += (" " + result)
end

puts new_sentence

# lol, launch school's solution is much simpler:
# advice.gsub!('important', 'urgent')
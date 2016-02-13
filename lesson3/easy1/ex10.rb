# Turn this array into a hash where the names are the keys and the values are the positions in the array.Turn

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

position = 0
hash = {}

flintstones.each do |person|
  hash[:"#{person}"] = position
  position += 1
end

p hash

# launchschool solution
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
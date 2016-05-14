# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

min = 1000
# why doesn't the below work?
# ages.each do |k, v| { min = v if v < min }

ages.each do |k, v|
  min = v if v < min
end

p min

# ls solution
ages.values.min
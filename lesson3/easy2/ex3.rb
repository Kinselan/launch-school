# throw out the really old people (age 100 or older).

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages
p ages.select { |k, v| v < 100 }

# ls solution
ages.keep_if { |name, age| age < 100 }
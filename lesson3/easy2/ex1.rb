ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# method 1
ages.include?("Spot")

# method 2
ages.has_key?("Spot")

# method 3
ages.key?("Spot")

# method 4
ages.member?("Spot")
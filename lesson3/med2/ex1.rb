require 'pry'

munsters = {
  "Herman"  => { "age" => 32,  "gender" => "male"   },
  "Lily"    => { "age" => 30,  "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male"   },
  "Eddie"   => { "age" => 10,  "gender" => "male"   }
}

# Figure out the total age of just the male members of the family.

total = 0

munsters.each do |k,v|
  if v["gender"] == "male"
  #  binding.pry
    total += v["age"]
  end
end

p total


# ls - basically the same algorithm but cleaner:
total_male_age = 0
munsters.each do |name, details|
  total_male_age += details["age"] if details["gender"] == "male"
end
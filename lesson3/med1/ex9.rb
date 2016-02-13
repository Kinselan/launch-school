munsters = {
  "Herman"  => { "age" => 32,  "gender" => "male"   },
  "Lily"    => { "age" => 30,  "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male"   },
  "Eddie"   => { "age" => 10,  "gender" => "male"   },
  "Marilyn" => { "age" => 23,  "gender" => "female" }
}

# modify the above hash to include "age group" key with kid/adult/senior values
# kid = 0-17
# adult = 18-64
# senior = 65+

# use a case statementa and range objects


munsters.each do |k,v|
  case v["age"]
  when 0..17
    v["age_group"] = "kid"
  when 18..64
    v["age_group"] = "adult"
  else
    v["age_group"] = "senior"
  end
end

p munsters
munsters = {
  "Herman"  => { "age" => 32,  "gender" => "male"   },
  "Lily"    => { "age" => 30,  "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male"   },
  "Eddie"   => { "age" => 10,  "gender" => "male"   }
}

# print (Name) is a (age) year old (male or female) for all people


munsters.each do |name, details|
  puts "#{name} is a #{details["age"]} year old #{details["gender"]}"
end
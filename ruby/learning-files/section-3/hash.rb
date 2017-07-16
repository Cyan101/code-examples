my_hash = { "name" => "Eric",
  "age" => 26,
  "hungry?" => true
}

puts my_hash["name"]
puts my_hash["age"]
puts my_hash["hungry?"]

#Works kind of like a JS Object (key-value pairs)

hash = Hash.new

hash["Food"] = "Pizza"

puts hash["Food"]

my_hash.each { |x, y| puts "#{x}: #{y}" }
my_hash.each_key { |x| puts "#{x}" }
my_hash.each_value { |y| puts "#{y}" }

no_nil_hash = ["1"] #default value is "1"


menagerie = { :foxes => 2,
  :giraffe => 1,
  :weezards => 17,
  :elves => 1,
  :canaries => 4,
  :ham => 1
}

#":" is known as a symbol

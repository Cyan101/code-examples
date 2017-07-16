puts "string".object_id
puts "string".object_id

puts :symbol.object_id
puts :symbol.object_id

#lists ID's

menagerie = { :foxes => 2,
  :giraffe => 1,
  :weezards => 17,
  :elves => 1,
  :canaries => 4,
  :ham => 1
}
#hash with symbols
new_hash = { one: 1,
  two: 2,
  three: 3
}
#After ruby 1.9 we use this

strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
symbols = []
#Convert string to symbols and put them in an array

strings.each do |s|
symbols.push(s.to_sym) #Alternate to "to_sym" is "intern", Reverse is to_s
end

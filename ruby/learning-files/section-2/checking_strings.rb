print "Write something please: "
input = gets.chomp
input.downcase!

if input.include? "a"
  puts "Contains 'a'!"
end

#checks if the string contains "pizza", returns true or false

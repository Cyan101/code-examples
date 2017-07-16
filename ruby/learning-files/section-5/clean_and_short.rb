puts "It's True" if true
puts "One is less than two!" if 1 < 2
puts "rawr" unless false

#boolean ? Do this if true: Do this if false
puts 3 < 4 ? "3 is less than 4!" : "3 is not less than 4."
puts 1 < 2 ? "One is less than two!" : "One is not less than two."

#when and then
case greeting
when "English" then puts "Hello!"
when "Finnish" then puts "Haloo!"
when "French" then puts "Bonjour!"
when "German" then puts "Guten Tag!"
else puts "I don't know that language"
end


my_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
my_array.each {  |x| puts x unless x % 2 == 1 } 

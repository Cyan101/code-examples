print "What's your username? "
username = gets.chomp
puts username

#"gets" grabs input, chomp removes the extra blank line thats automatically added

print "Do you like Ruby so far? "
answer = gets.chomp

print "How old are you? "
age = gets.chomp

puts "Your username is #{username}, you answered #{answer} and are #{age} year/s old!"

#Incase our users forget to capitalize we can do it for them
user = username.capitalize #This would save "user" as a capitalized version of "username", leaving "username" untouched
username.capitalize! #The "!" means we are modifying the current variable, rather than assinging it to a new one

puts "Your username is #{username}, you answered #{answer} and are #{age} year/s old!"
puts "Your username is #{user}, you answered #{answer} and are #{age} year/s old!"


=begin
 Without -
  Your username is Cyan
  , you answered Yes
  and are 18
  old!
 With-
  Your username is Cyan, you answered Yes and are 18 old!
=end

print "Please enter a number: "
num = Integer(gets.chomp)

if num < 0
  puts "You entered a negative number!"
elsif num > 0
  puts "You entered a positive number!"
else
  puts "You entered zero!"
end

unless num < 5
  puts "Ruby is a 5/5"
elsif num > 5
  puts "or a 10/10"
end

if num != 10
  puts "Why isn't it a 10?"
elsif num == 10
  puts "Better!"
end

#Pretty easy to understand, runs some "If" statements.
#"elsif" and "else" only run if the previous "elsif" or "if" didn't
#"unless" reverses this, it runs only if the statement is false
#"==" means equal to, "!=" means not equal to
#Anything that isn't false or nil is "true"

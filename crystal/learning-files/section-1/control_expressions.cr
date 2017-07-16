# The only falsey values are nil, false and null pointers (pointers whose memory address is zero). Any other value is truthy.
a = 1
if some_condition
  a = "hello"
else
  a = true
end
# a : String | Bool
b = 1
if some_condition
  b = "hello"
end
# b : Int32 | String
if some_condition
  c = 1
else
  c = "hello"
end
# c : Int32 | String
if some_condition
  d = 1
end
# d : Int32 | Nil

# If one of the branches never reaches past the end of an if, like in the case of a return, next, break or raise, that type is not considered at the end of the if:

a = 2 if some_condition
# The above is the same as:
if some_condition
  a = 2
end

# If an if branch is empty, or it’s missing, it’s considered as if it had nil in it:
if 1 > 2
  3
end
# The above is the same as:
if 1 > 2
  3
else
  nil
end
# Another example:
if 1 > 2
else
  3
end
# The above is the same as:
if 1 > 2
  nil
else
  3
end

# The ternary if allows writing an if in a shorter way:
a = 1 > 2 ? 3 : 4
# The above is the same as:
a = if 1 > 2
      3
    else
      4
    end

# If a variable is the condition of an if, inside the then branch the variable will be considered as not having the Nil type:
a = some_condition ? nil : 3
# a is Int32 or Nil
if a
  # Since the only way to get here is if a is truthy,
  # a can't be nil. So here a is Int32.
  a.abs
end
if a = some_expression
  # here a is not nil
end


if @a.is_a?(String)
  # here @a is not guaranteed to be a String
end
a = @a
if a.is_a?(String)
  # here a is guaranteed to be a String
end

a = some_condition ? 1 : "hello"
# a : Int32 | String
if a.responds_to?(:abs)
  # here a will be Int32, since Int32#abs exists but String#abs doesn't
else
  # here a will be String
end

a = some_condition ? nil : 3
if a.nil?
  # here a is Nil
else
  # here a is Int32
end

a = nil
if !a
  # here a is Nil or False
else
  # here a is "truthy"
end


# unless conditions
unless some_condition
  then_expression
else
  else_expression
end

# The above is the same as:
if some_condition
  else_expression
else
  then_expression
end

# Can also be written as a suffix
close_door unless door_closed?



#Case statements
case exp
when value1, value2
  do_something
when value3
  do_something_else
else
  do_another_thing
end


#while loops
a = 1
while some_condition
  # a : Int32 | String
  a = "hello"
  # a : String
  a.size
end
# a : Int32 | String

while true
  do_something
  break if some_condition
end


#loops
loop do
  do_something
  break if some_condition
end

#break out of a loop
a = 2
while (a += 1) < 20
  if a == 10
    # goes to 'puts a'
    break
  end
end
puts a #=> 10


#next
a = 1
while a < 5
  a += 1
  if a == 3
    next
  end
  puts a
end
# The above prints the numbers 2, 4 and 5



#until
until some_condition
  do_this
end

# The above is the same as:
while !some_condition
  do_this
end
#break and next can also be used inside an until




# && (and)
some_exp1 && some_exp2

# The above is the same as:
tmp = some_exp1
if tmp
  some_exp2
else
  tmp
end

# || (or)
some_exp1 || some_exp2

# The above is the same as:
tmp = some_exp1
if tmp
  tmp
else
  some_exp2
end
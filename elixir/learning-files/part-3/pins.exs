# Rebinding/Reassigning variables can still be done in Elixir
x = 1
x = 2

# Use the pin operator ^ when you want to pattern match against an existing variable’s value rather than rebinding the variable
^x = 3
#=> MatchError


# In some cases, you don’t care about a particular value in a pattern. It is a common practice to bind those values to the underscore, _.
# For example, if only the head of the list matters to us, we can assign the tail to underscore:
[h | _] = [1, 2, 3]
IO.puts h
#=> 1
# The variable `_` is special in that it can never be read from. Trying to read from it gives an unbound variable error


# Although pattern matching allows us to build powerful constructs, its usage is limited.
# For instance, you cannot make function calls on the left side of a match. The following example is invalid
length([1, [2], 3]) = 3
#=> CompileError

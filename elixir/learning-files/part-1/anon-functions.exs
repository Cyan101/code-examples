# Anonymous functions can be created inline and are delimited by the keywords fn and end

add = fn a, b -> a + b end
add.(1, 2) # Note that a dot (.) between the variable and parentheses is required to invoke an anonymous function.
is_function(add)
is_function(add, 2) # check if add is a function that expects exactly 2 arguments

# Functions are “first class citizens” in Elixir
# Meaning they can be passed as arguments to other functions in the same way as integers and strings.
# This is how we passed it to the is_function function

# Anonymous functions are closures and as such they can access variables that are in scope when the function is defined.
double = fn a -> add.(a, a) end
double.(4)

# Also like Ruby, functions are in their own scope, so you can assign variables and they wont affect anything outside the fucntion

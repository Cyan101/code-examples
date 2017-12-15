# `=` is also known as the "match" operator
x = 1
1 = x
#=> 1
2 = x
#=> MatchError
# This is because both sides do not equal the same value (1)

# Pattern Matching
{a, b, c} = {:hello, "world", 42}
IO.puts a
#=> :hello
IO.puts b
#=> "world"

{a, b, c} = {:hello, "world"}
#=> MatchError
# This is because both sides do not have the same size

{a, b, c} = [:hello, "world", 42]
#=> MatchError
# This is because they are different data types

{:ok, result} = {:ok, 13}
# This will limit matching to when the right-hand side starts with `:ok`
{:ok, result} = {:error, :oops}
#=> MatchError

[a, b, c] = [1, 2, 3]
IO.puts a
#=> 1
# Pattern Matching works on lists
[head | tail] = [1, 2, 3]
IO.puts head
#=> 1
IO.puts tail
#=> [2,3]

list = [1, 2, 3]
IO.puts [0 | list]
#=> [0,1,2,3]

# Pattern matching allows developers to easily destructure data types such as tuples and lists.
# It is one of the foundations of recursion in Elixir and applies to other types as well, like maps and binaries.

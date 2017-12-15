[1, 2, true, 3]

# Yeah.... pretty much the same as every language

length [1,2,3,4] # No idea why you can do this on arrays but not strings

[1, 2, 3] ++ [4, 5, 6]
#=> [1, 2, 3, 4, 5, 6]
[1, true, 2, false, 3, true] -- [true, false]
#=> [1, 2, 3, true]

# List operators never modify the existing list. Concatenating to or removing elements from a list returns a new list.
# We say that Elixir data structures are immutable. One advantage of immutability is that it leads to clearer code.
# You can freely pass the data around with the guarantee no one will change it - only transform it.

# check notes.txt for more on immutability

# The head is the first element of a list and the tail is the remainder of the list.
list = [1, 2, 3]
hd(list)
#=> 1
tl(list)
#=> [2,3]

# If Elixir see's a list of ASCII characters or anything likewise, it will actually print them out
[104, 101, 108, 108, 111]
#=> 'hello'

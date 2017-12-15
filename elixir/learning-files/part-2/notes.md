## Arrays/Lists vs Tuples

Lists are stored in memory as linked lists, meaning that each element in a list holds its value and points to the following element until the end of the list is reached. This means accessing the length of a list is a linear operation: we need to traverse the whole list in order to figure out its size.

Tuples, on the other hand, are stored contiguously in memory. This means getting the tuple size or accessing an element by index is fast. However, updating or adding elements to tuples is expensive because it requires creating a new tuple in memory.


>Note that this applies only to the tuple itself, not its contents. For instance, when you update a tuple, all entries are shared between the old and the new tuple, except for the entry that has been replaced. In other words, tuples and lists in Elixir are capable of sharing their contents. This reduces the amount of memory allocation the language needs to perform and is only possible thanks to the immutable semantics of the language.


Those performance characteristics dictate the usage of those data structures. One very common use case for tuples is to use them to return extra information from a function. For example, `File.read/1` is a function that can be used to read file contents. It returns a tuple:

    iex> File.read("path/to/existing/file")
    {:ok, "... contents ..."}
    iex> File.read("path/to/unknown/file")
    {:error, :enoent}

>Most of the time, Elixir is going to guide you to do the right thing.

For example, there is an `elem/2` function to access a tuple item but there is no built-in equivalent for lists:

    iex> tuple = {:ok, "hello"}
    {:ok, "hello"}
    iex> elem(tuple, 1)
    "hello"

### Some extra info
---
When counting the elements in a data structure, Elixir also abides by a simple rule: the function is named `size` if the operation is in constant time (i.e. the value is pre-calculated) or `length` if the operation is linear (i.e. calculating the length gets slower as the input grows). As a mnemonic, both “length” and “linear” start with “l”.

We use `byte_size` to get the number of bytes in a string – a cheap operation. Retrieving the number of Unicode characters, on the other hand, uses `String.length`, and may be expensive as it relies on a traversal of the entire string. `tuple_size/1` (for tuple size), `length/1` (for list length). Interesting we have to specify "tuple" in `tuple_size` but not "list" in `length`.

## Coding "mannerisms"
---
Can't think of the right word so i'm just using "mannerisms" cause its fancy, As a rule of thumb, use `and`, `or` and `not` when you are expecting booleans. If any of the arguments are non-boolean, use `&&`, `||` and `!`.

## Misc
---
Elixir also provides ==, !=, ===, !==, <=, >=, <, and > as comparison operators, the difference between == and === is that the latter is more strict when comparing integers and floats. (If you want to compare a string with an Int you'll need to convert one)

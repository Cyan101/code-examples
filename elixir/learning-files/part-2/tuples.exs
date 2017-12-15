example = {:ok, "hello"}
tuple_size example

# Tuples store elements contiguously in memory.
# This means accessing a tuple element by index or getting the tuple size is a fast operation.

put_elem(example, 1, "world")
#=> {:ok, "world"}
example
#=> {:ok, "hello"}
# Remember that variables and such in Elixir are immutable!

# Assigns to a local variable
local = 1
# Assigns to an instance variable
@instance = 2
# Assigns to a class variable
@@class = 3

local += 1  # same as: local = local + 1
# The above is valid with these operators:
# +, -, *, /, %, |, &, ^, **, <<, >>
local ||= 1 # same as: local || (local = 1)
local &&= 1 # same as: local && (local = 1)

# Syntax Sugar
# A setter
person.name=("John")
# The above can be written as:
person.name = "John"
# An indexed assignment
objects.[]=(2, 3)
# The above can be written as:
objects[2] = 3
# Not assignment-related, but also syntax sugar:
objects.[](2, 3)
# The above can be written as:
objects[2, 3]

# You can set multiple variables at a time
name, age = "Crystal", 1
# The above is the same as this:
temp1 = "Crystal"
temp2 = 1
name  = temp1
age   = temp2

name, age, source = "Crystal,1,github".split(",")
# The above is the same as this:
temp = "Crystal,1,github".split(",")
name   = temp[0]
age    = temp[1]
source = temp[2]

names = "John", "Peter", "Jack"
# The above is the same as:
names = ["John", "Peter", "Jack"]